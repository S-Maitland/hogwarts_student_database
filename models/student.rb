require_relative('../db/sql_runner.rb')
require_relative('house.rb')

class Student

attr_reader :id
attr_accessor :first_name, :second_name, :house_id, :age

  def initialize(options)
    @first_name = options['first_name']
    @second_name = options['second_name']
    @house_id = options['house_id'].to_i
    @age = options['age'].to_i
    @id = options['id'].to_i if options['id']
  end

  def save()
    sql = 'INSERT INTO students(
    first_name,
    second_name,
    house_id,
    age
  )
    VALUES ($1, $2, $3, $4)
    RETURNING ID'
    values = [@first_name, @second_name, @house_id, @age]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def self.all()
    sql = 'SELECT * FROM students;'
    results = SqlRunner.run(sql)
    return results.map {|student| Student.new(student)}
  end

  def self.find_by_id(id)
    sql = 'SELECT * FROM students WHERE id = $1'
    values = [id]
    result = SqlRunner.run(sql, values)[0]
    return Student.new(result)
  end

  # def find_house()
  #   sql = 'SELECT * FROM houses INNER JOIN students ON house_id = houses.id WHERE houses.id = $1'
  #   values = [id]
  #   return SqlRunner.run(sql, values)[0]
  # end

  def house()
    sql = ' SELECT * FROM houses WHERE id = $1'
    values = [@house_id]
    result = SqlRunner.run(sql, values)[0]
    return House.new(result)
  end

end
