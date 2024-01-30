# WILDCAT 

dockerfile includes `libgeos-dev` required to build rgeos

* API docs
> https://documenter.getpostman.com/view/1500771/2s9Yyqj3CU

* Ruby version

> 3.2.2

* System dependencies

> `libgeos-dev`

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
