require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('models/student.rb')
also_reload('models/*')

#INDEX
get '/students' do
  @students = Student.all()
  erb(:index)
end

#NEW
get '/students/new' do
  @houses = House.all()
  erb(:new)
end
