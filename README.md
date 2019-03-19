# README

* Ruby version : '2.5.1'

* Rails version : '5.2.2'

* Database : Postgres

* Uploader : paperclip 6.0.0

* RMagick : ImageMagick image processing library

App Details :

The app is used to upload images and the uploaded images cab resized into any dimentions by given width and height. 

The primary use of this app is the image optimization.

The technology used in this is Ruby on rails,  paperclip for image upload, AWS S3 for uploaded image file storage on cloud and Rmagick for image optimization. 

To run the app on local here are the steps :

1. Clone the app. 
2. Run bundle install. 
3. Rake db:setup.
4. Copy paperclip settings from production.rb file to development.rb and replace your aws s3 credentials.
5. Rails server and app is running.


Heroku URL : https://chela-test-job.herokuapp.com/
