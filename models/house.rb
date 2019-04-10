require_relative('../db/sql_runner.rb')

class House

attr_reader :id
attr_accessor :house_name, :logo

  def initialize(options)
    @house_name = options['house_name']
    @logo = options['logo']
    @id = options['id'].to_i if options['id']
  end

  def save()
    sql = 'INSERT INTO houses(
    house_name,
    logo
  )
    VALUES ($1, $2)
    RETURNING ID'
    values = [@house_name, @logo]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def self.all()
    sql = 'SELECT * FROM houses;'
    results = SqlRunner.run(sql)
    return results.map {|house| House.new(house)}
  end

  def self.find_by_id(id)
    sql = 'SELECT * FROM houses WHERE id = $1'
    values = [id]
    result = SqlRunner.run(sql, values)[0]
    return House.new(result)
  end

  def self.delete_all()
    sql = 'DELETE FROM houses'
    SqlRunner.run(sql)
  end

end
