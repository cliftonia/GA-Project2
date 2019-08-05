# require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require_relative 'database_config'
require 'email_address'


require_relative 'models/picture'
require_relative 'models/comment'
require_relative 'models/user'
require_relative 'models/like'
# require_relative 'models/ImageUploader'

enable :sessions



helpers do 
  
  def logged_in? # predicate method - will return a boolean
    # !!current_user or you can use below
    if current_user
     return true
    else  
     return false
    end
  end 

  def admin_logged_in?
    if admin
      return true
    else
      return false
    end
  end

  def current_user
    return User.find_by(id: session[:user_id])
  end

  def admin
    return User.find_by username: "admin"
  end

end

after do 
  ActiveRecord::Base.connection.close
end

get '/' do
  @pictures = Picture.all
  @pictures = Picture.where(solved: nil, reported: nil)
  erb :index
end

get '/about' do
  
  erb :about
end

get '/reports' do
  @pictures = Picture.all
  @pictures = Picture.where.not(reported: nil)
  erb :report
end 
# require 'pry'

post '/reports' do
  report = Picture.find_by id: "#{params[:picture_id]}"
  # binding.pry
  report.reported = params[:picture_id]
  report.save
  redirect "/"
end 


require_relative 'routes/mypictures'
require_relative 'routes/likes'
require_relative 'routes/solved'
require_relative 'routes/pictures'
require_relative 'routes/comments'
require_relative 'routes/sessions'

