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