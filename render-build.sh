# exit on error
set -o errexit

bundle install
bundle exec rails db:create
bundle exec rails db:migrate

bundle exec rake data:wildcat_priority_area_import