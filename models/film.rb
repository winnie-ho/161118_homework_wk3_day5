require('pg')

class Film

  attr_reader :id
  attr_accessor :title, :price

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @title = options["title"]
    @price = options["price"]
  end

  def save()
    sql = "INSERT INTO films (title, price) VALUES ('#{@title}',#{@price}) RETURNING *;"
    result = SqlRunner.run(sql)
    @id = result[0]['id']
  end

  def update()
    sql= "UPDATE films SET (title, price) = ('#{title}', '#{price}') WHERE id = #{@id};"
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