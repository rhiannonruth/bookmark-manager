ENV['RACK_ENV'] = 'test'

require './app.rb'

require 'capybara'
require 'capybara/rspec'
require 'rspec'
require './models/link.rb'
require 'database_cleaner'

Capybara.app = Bookmark_Manager

RSpec.configure do |config|
  config.include Capybara::DSL

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

end
