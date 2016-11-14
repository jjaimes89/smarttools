source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0'

# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
gem "mini_magick"
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
gem "devise"
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
gem 'will_paginate'
gem "will_paginate_mongoid"

gem 'unicorn'
gem 'bcrypt', '~> 3.1.7'
gem 'carrierwave'
gem 'bootstrap-sass', '~> 3.2.0'
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'jwplayer-rails', :git => 'git://github.com/dutgriff/jwplayer-rails.git'

#gem 'mongo', '~> 1.8'
#gem 'mongo_mapper', '~> 0.13.1'

#gem 'rufus-scheduler'
gem 'whenever', require: false
gem 'streamio-ffmpeg'

#MONDO DB GEMS

gem 'bson_ext'
gem 'mongoid', '~> 6.0'
gem 'carrierwave-mongoid', :require => 'carrierwave/mongoid'
gem 'mongoid-grid_fs', github: 'ahoward/mongoid-grid_fs'

gem 'dalli-elasticache'
gem 'aws-ses'
gem 'aws-sdk', '~> 1.6.9'
gem 'fog-aws' #integración S3 de Amazon

gem 'mongoid-sadstory' #Correccion de Date_select en campos de fechas
gem 'mongoid-slug' #Arregla la url manipulable en el path uri

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
