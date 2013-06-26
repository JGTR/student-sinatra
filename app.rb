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

    get '/students/new' do  
      erb :'newstudentform', :layout => true
    end

    get '/students/:id' do
      student_id = params[:id]
      @student = Student.find(student_id)
      erb :'students/student', :layout => false
    end

    post '/students/' do
      @name    = params[:name]
      @tagline = params[:tagline]
      @bio     = params[:bio]

      student = Student.new
      student.name    = @name
      student.bio     = @bio
      student.tagline = @tagline
      student.work = ""

      student.save
       
      erb :'filledstudentform', :layout => true
    end

    get '/students/:id/edit' do
      student_id = params[:id]
      @student = Student.find(student_id)
      erb :'editstudentform', :layout => false
    end

    post '/students/:id' do
      @student = Student.find(params[:id])
      @student.name = params[:name]
      @student.bio = params[:bio]
      @student.tagline = params[:tagline]
      @student.save
      erb :'students/student', :layout => false
    end

#we want a web form for new students
#creates a new student


  end
end


