require 'spec_helper'

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) { DatabaseCleaner.start }
  config.after(:each) { DatabaseCleaner.clean }
end

feature 'Creating Links' do
  scenario 'Creating a link' do
    visit '/links/new'
    fill_in :title, with: 'Amazon'
    fill_in :url, with: 'http://www.amazon.co.uk/'
    click_button 'Submit'
    expect(current_path).to eq '/links'
    expect(page).to have_content 'Amazon'
  end
end
