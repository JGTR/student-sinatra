require 'sinatra/base'
require './lib/models/student.rb'
require 'sqlite3'


# Why is it a good idea to wrap our App class in a module?
module StudentSite
  class App < Sinatra::Base
    get '/' do
      "hello world!"
    end

    get '/hello-world' do
      @random_numbers = *(1..20)
      erb :hello
    end

    get '/artists' do

      x= "Joaquin Phoenix"
      y = "River Phoenix"

      @artists = [x, y]
      erb :artists
    end

    get '/students' do
      # @students = Students.all
      @students = Student.all
      erb :'students/index', :layout => true
    end

    get '/students/:id' do
      student_id = params[:id]
      @student = Student.find(student_id)
      erb :'students/student', :layout => false
    end

  end
end


