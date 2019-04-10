require_relative('../db/sql_runner.rb')

class Student

attr_reader :id
attr_accessor :first_name, :second_name, :house_name, :age

  def initialize(options)
    @first_name = options['first_name']
    @second_name = options['second_name']
    @house_name = options['house_name']
    @age = options['age'].to_i
    @id = options['id'].to_i if options['id']
  end

  def save()
    sql = 'INSERT INTO students(
    first_name,
    second_name,
    house_name,
    age
  )
    VALUES ($1, $2, $3, $4)
    RETURNING ID'
    values = [@first_name, @second_name, @house_name, @age]
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
end
