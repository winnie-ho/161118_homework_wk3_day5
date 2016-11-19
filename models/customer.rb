require ('pg')
require_relative ('../db/sql_runner')


class Customer
  
  attr_accessor :funds
  attr_reader :name, :id

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @name = options["name"]
    @funds = options["funds"]
  end

  def save()
    sql = "INSERT INTO customers (name, funds) VALUES ('#{@name}', #{funds}) RETURNING * ;"
    result = SqlRunner.run(sql)
    @id = result[0]['id'].to_i
  end

  def update()
    sql = "UPDATE customers SET (id, name, funds) = (#{@id}, '#{@name}', @#{funds}) WHERE id = #{@id}; "
    result = SqlRunner.run(sql)
  end

  def delete()
    return unless @id
    sql = "DELETE from customers WHERE id = #{@id};"
    result = SqlRunner.run(sql)
  end

  def buy_ticket(film)
    @funds -= film.price
    update()
  end

  def number_of_tickets
    sql = "SELECT count (customer_id) FROM tickets WHERE customer_id = #{@id};"
    result = SqlRunner.run(sql)
    return result[0].values
  end


  def self.all()
    sql = "SELECT * FROM customers;"
    customers = SqlRunner.run(sql)
    return customers.map{|hash|Customer.new(hash)}
  end

  def self.delete_all()
    sql = "DELETE FROM customers;"
    SqlRunner.run(sql)
  end

end