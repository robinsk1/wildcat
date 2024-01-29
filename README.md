# WILDCAT 

> https://wildcat-jrgm.onrender.com

deploy ok but missing data layer due to an issue with Rgeos on amazon-linux (render, fly.io) https://github.com/rgeo/rgeo/issues/365 :(

dockerfile includes `libgeos-dev` required to build rgeos


* API docs
> https://documenter.getpostman.com/view/1500771/2s9Yyqj3CU

* Ruby version

> 3.2.2

* System dependencies

> `libgeos-dev` if on debian linux

> install postgresql db app (https://postgresapp.com/downloads.html) 

* Configuration

> bundle install

* Database creation

>  rails db:create && rake db:migrate

* Populate wildcat data

> rake data:wildcat_priority_area_import

* How to run the test suite

> rails test

* Docker

i've provided a docker file in case thats easier....

> docker-compose up

and then db:create && db:migrate then rake data:wildcat_priority_area_import 
in docker `web` container
