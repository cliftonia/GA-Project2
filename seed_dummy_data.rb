# setup app enviroment

require_relative 'database_config'
require_relative 'models/picture'
require_relative 'models/comment'
require_relative 'models/user'

Comment.delete_all
Picture.delete_all
User.delete_all
Like.delete_all

user = User.new
user.email = "test@test.com"
user.username = "test"
user.password = "test"
user.save

user = User.new
user.email = "clifton.baggerman@me.com"
user.username = "admin"
user.password = "admin"
user.save

titles = ['Fish', 'Dog', 'Mouse', 'rabbit']
titles2 = ['jelly', 'Whale', 'Rat', 'House']
captions = ['sombebody help me', 'ugh what is this', 'um i have no idea what this is', 'i think it might be a dog']
img = ["https://placekitten.com/g/200/300", "http://placekitten.com/200/300", "https://i.pinimg.com/originals/4d/79/99/4d7999a51a1a397189a6f98168bcde45.jpg", "https://www.cbc.ca/natureofthings/content/images/episodes/lioninyourlivingroom2_1280.jpg", "https://tinselondinosaurs.files.wordpress.com/2016/11/jp3.jpg?w=300&h=225", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRxxFXhCwiogf5Td2aa7P5TDoITW3dG1kK__vZroXgkYzz4NA6LhA", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQHFfeEqR92IzkdUEkySkSklm1hWfRzLYhGNCi1J-Q1XTg6cEM1Fw"]

10.times do 

  picture = Picture.new
  picture.title = "#{titles.sample} #{titles2.sample}"
  picture.user_id = user.id
  picture.body = "#{captions.sample}"
  picture.image_file = File.open()
  picture.date = Date.today
  picture.save

end 