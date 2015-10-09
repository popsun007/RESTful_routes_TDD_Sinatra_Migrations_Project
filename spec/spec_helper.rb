ENV['SINATRA_ENV'] = 'test'

require_relative '../server'
require 'capybara'
require 'database_cleaner'

Capybara.app = Sinatra::Application

RSpec.configure do |config|
  config.include Capybara::DSL

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end