# Whatsthat
whatsthat is an app that people post images with a question wanting to find out what the images is.  

Here is the link: https://whatsthat-webapp.herokuapp.com/

## App features:
* comment on images
* like comments that pushes up the most liked one to the top
* Original poster is able to select the correct comment which movies the image into a solved section
* create user accounts
* report images that are inappropriate

## Technologies
* Built in Ruby with Sinatra framework
* ActiveRecord
* Postgres
* ORM

## Approach
when creating this app my first approach was to do create some wireframes to give me an idea of what I wanted my final web app to look like.

Once the thought process for the wireframes where done, I then thought about my database and the relationships that I would need between them.

I create the following tables using SQL:
* Users
* Pictures
* Comments
* Likes


## Challenges & lessons learnt
one of my biggest challanges was with pushing the most liked comments to the top of the page. this taught me a lot about sub queries. 

## Still to do...
* Finish up my relationship mapping
* Create validation on project, do it for login, signup,  new post,  edit post
* Finish off the reported images section to be able to unreport an image
* Add the ability to delete comments
 