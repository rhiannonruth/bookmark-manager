require 'spec_helper'
require 'capybara'

feature 'View Links' do

  scenario 'View a list of links' do
    Link.create(url: 'https://www.google.co.uk/', title: 'Google')
    visit '/'
    expect(page).to have_link('Google', href: 'https://www.google.co.uk/')
  end
end
