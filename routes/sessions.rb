get '/login' do
  erb :login
end

post '/sessions' do
  # params[:email]
  # params[:password]

  # 1. look up the user with the email address 
  user = User.find_by(username: params[:username])
  # 2.  
  if user && user.authenticate(params[:password])
    # create a session

    session[:user_id] = user.id # its a hash - named session
    # yay - please follow me 
    redirect "/"
  else
    # wrong email or password
    erb :login
  end
end

delete '/sessions' do
  # destroy the session
  session[:user_id] = nil
  # redirect
  redirect '/login'
end

get '/signup' do
  erb :signup
end 

post '/users' do
  user = User.new
  user.username = params[:username]
  user.email = params[:email]
  user.password = params[:password]
  user.save
  session[:user_id] = user.id
  redirect '/'
  # add a email
  # add a password
end

# User.destroy_all