require 'spec_helper'
require 'capybara'

feature 'Creating Links' do
  scenario 'Creating a link' do
    visit '/links/new'
    fill_in :title, with: 'Amazon'
    fill_in :url, with: 'http://www.amazon.co.uk/'
    click_button 'Submit'
    expect(page).to have_content 'Amazon'
  end
end
