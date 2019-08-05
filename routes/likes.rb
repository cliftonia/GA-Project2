post '/likes' do
  like = Like.new
  like.comment_id = params[:comment_id]
  like.user_id = current_user.id
  like.save
  
  redirect "/pictures/#{params[:picture_id]}"
end