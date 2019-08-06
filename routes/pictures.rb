get '/pictures/new' do
  erb :new
end

post '/pictures' do
  picture = Picture.new
  picture.title = params[:title]
  picture.image_file = params[:image_file]
  picture.body = params[:body]
  picture.user_id = current_user.id
  picture.date = Date.today
  picture.save
  redirect '/'
end

get '/pictures/:id' do 
  # redirect '/login' unless session[:user_id]

  @picture = Picture.find(params[:id])
  # @comments = Comment.where(picture_id: params[:id])

  # @comments = ActiveRecord::Base.connection.exec_query("SELECT comment_id, COUNT(*) AS likes FROM likes WHERE comment_id IN (SELECT id FROM comments WHERE picture_id = #{@picture.id}) GROUP BY comment_id ORDER BY likes DESC;")

  @comments = Like
              .select("comment_id, COUNT(*) AS likes")
              .where("comment_id IN (SELECT id FROM comments WHERE picture_id = ?)", @picture.id)
              .group(:comment_id)
              .order(likes: :desc)

  @comments = @comments.map do |c|
    Comment.find(c["comment_id"])
  end

  admin = User.find_by username: "admin"

  erb :show
end

get '/pictures/:id/edit' do 
  @picture = Picture.find(params[:id])
  erb :edit
end

put '/pictures/:id' do
  picture = Picture.find(params[:id])
  picture.body = params[:body]
  picture.image_file = params[:image_file]
  picture.save
  redirect "/pictures/#{picture.id}"
end

delete '/pictures/:id' do
  picture = Picture.find(params[:id])
  picture.delete
  redirect "/"
end