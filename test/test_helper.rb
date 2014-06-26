#require "bundler/setup"
Bundler.require(:default)
require "minitest/autorun"
require "minitest/pride"
require "logger"

ENV["RACK_ENV"] = "test"

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }



