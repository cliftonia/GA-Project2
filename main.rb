# require 'pry'
require 'sinatra'
# require 'sinatra/reloader'
require_relative 'database_config'
# require 'carrierwave'
# require 'carrierwave/orm/activerecord'
# require 'fog'


require_relative 'models/picture'
require_relative 'models/comment'
require_relative 'models/user'
require_relative 'models/like'

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
  @pictures = Picture.where(solved: nil)
  erb :index
end

get '/my_pictures' do 
  @pictures = Picture.where(user_id: current_user.id)
  erb :my_pictures
end 

post '/likes' do
  like = Like.new
  like.comment_id = params[:comment_id]
  like.user_id = current_user.id
  like.save
  
  redirect "/pictures/#{params[:picture_id]}"
end

get '/solved_pictures' do 
  @pictures = Picture.where.not(solved: nil)
  erb :solved_images
end 

post '/solved_pictures' do
  solved = Picture.find_by id: "#{params[:picture_id]}"
  solved.solved = params[:comment_id]
  solved.save

  redirect "/solved_pictures"
end

require_relative 'routes/pictures'
require_relative 'routes/comments'
require_relative 'routes/sessions'

