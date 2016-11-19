require ('pg')
require_relative ('../db/sql_runner')

class Ticket
  attr_reader :id
  attr_accessor :customer_id, :film_id, :film_time

  def initialize (options)
    @id = options["id"].to_i if options["id"]
    @customer_id = options["customer_id"].to_i
    @film_id = options ["film_id"].to_i
    @film_time = options["film_time"]
  end

  def save()
    sql = "INSERT INTO tickets (customer_id, film_id, film_time) VALUES (#{@customer_id}, #{@film_id}, '#{@film_time}') RETURNING *;"
    result = SqlRunner.run(sql)
    @id = result[0]['id'].to_i
  end

  def delete()
    return unless @id
    sql = "DELETE FROM tickets WHERE id = #{@id};"
    result = SqlRunner.run(sql)
  end 

  def self.all()
    sql = "SELECT * FROM tickets;"
    tickets = SqlRunner.run(sql)
    result = tickets.map{|hash|Ticket.new(hash)}
  end

  def self.delete_all()
    sql = "DELETE FROM tickets;"
    SqlRunner.run(sql)
  end



end