require 'sinatra/base'
require './lib/models/student.rb'
require 'sqlite3'


# Why is it a good idea to wrap our App class in a module?
module StudentSite
  class App < Sinatra::Base
    get '/' do
      @students = Student.all
      erb :'students/index', :layout => true
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

    get '/newstudentform' do
      
      erb :'newstudentform', :layout => false

    end

    post '/filledstudentform' do
      @name    = params[:name]
      @tagline = params[:tagline]
      @bio     = params[:bio]

      student = Student.new
      student.name    = @name
      student.bio     = @bio
      student.tagline = @tagline
      student.work = ""

      student.save
       
      erb :'filledstudentform', :layout => false

    end

    get '/students/:id/edit' do
      student_id = params[:id]
      @student = Student.find(student_id)
      erb :'students/student', :layout => false
    end

    get '/editstudentform' do
      
      erb :'editstudentform', :layout => false

    end


#we want a web form for new students
#creates a new student


  end
end


