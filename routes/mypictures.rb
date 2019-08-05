get '/my_pictures' do 
  @pictures = Picture.where(user_id: current_user.id)
  erb :my_pictures
end 
