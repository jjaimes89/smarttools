require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
# require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
require "rails/test_unit/railtie"


Bundler.require :default, Rails.env
#Bundler.require(*Rails.groups)



module Smarttools
  class Application < Rails::Application
  

config.time_zone = 'Bogota'
  end
end
