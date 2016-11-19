require('pg')

class Film

  attr_reader :id
  attr_accessor :title, :price, :capacity

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @title = options["title"]
    @price = options["price"]
    @capacity = options["capacity"]
  end

  def save()
    sql = "INSERT INTO films (title, price, capacity) VALUES ('#{@title}',#{@price}, #{@capacity}) RETURNING *;"
    result = SqlRunner.run(sql)
    @id = result[0]['id']
  end

  def update()
    sql= "UPDATE films SET (title, price, capacity) = ('#{@title}', #{@price}, #{@capacity}) WHERE id = #{@id};"
    result = SqlRunner.run(sql)
  end

  def delete()
    return unless @id
    sql = "DELETE FROM films WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def audience_count()
    sql = "SELECT count (film_id) FROM tickets WHERE film_id = #{@id};"
    result = SqlRunner.run(sql)
    return result[0].values
  end

  def most_popular_time()
    sql = "SELECT (film_time) FROM tickets WHERE film_id = #{@id};"
    result = SqlRunner.run(sql)
    tickets_array = result.map{|ticket|Ticket.new(ticket)}
    time_array = tickets_array.map{|ticket|ticket.film_time}

    counts = Hash.new 0
    tickets_per_film_time_count = time_array.each{|time|counts[time]+=1}
    most_pop_showing = counts.max_by{|k,v| v}
    puts "The most popular showing of #{@title} is the #{most_pop_showing[0]} showing."
  end

  def full_check(showing)
    sql = "SELECT count (film_id) FROM tickets WHERE film_id = #{@id} AND film_time = '#{showing}';"
    result = SqlRunner.run(sql)
    seats_taken = result[0].values[0].to_i


    if @capacity > seats_taken
      puts "Seats still available"
    else
      puts "This showing of #{@title} is full"
    end
  end

  def self.all()
    sql = "SELECT * FROM films;"
    films = SqlRunner.run(sql)
    result = films.map{|hash|Film.new(hash)}
  end

  def self.delete_all()
    sql = "DELETE FROM films;"
    SqlRunner.run(sql)
  end

end