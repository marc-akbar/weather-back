# README

This is a real-time weather data app that changes background based off local weather conditions. Powered by Dark Sky API.

Built in Rails 6 using ActiveJob to schedule database queries and ActionCable / Redis / Sidekiq to for real-time UI updates.


##### Clone using:

`$ git clone git@github.com:marc-akbar/weather-back.git`

##### Ensure ruby `2.6.0` is installed:
- rvm: `$ rvm install ruby-2.6.0`
- asdf: `$ asdf install ruby 2.6.0`

##### Ensure dependencies are installed:

`$ bundle install`

##### Create .env file from .env.example and fill in environment variables.

`$ cp .env.example .env`

##### Create .database.yml file from .database.yml.example and fill in postrges login credentials.

`$ cp config/database.yml.example config/database.yml`

##### Run local server and sidekiq for ActionCable:

`$ bundle exec sidekiq`
`$ rails server`
