$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'contactually'
require 'webmock/rspec'
require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}
