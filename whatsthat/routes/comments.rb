post '/comments' do 
  redirect '/login' unless session[:user_id]
  comment = Comment.new
  comment.body = params[:body]
  comment.picture_id = params[:picture_id]
  comment.date = Time.now.strftime("%Y-%d-%m %H:%M:%S %Z")
  comment.user_id = current_user.id
  comment.save
  redirect "/pictures/#{params[:picture_id]}"
end