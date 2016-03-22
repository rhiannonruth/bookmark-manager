require 'spec_helper'

set_database

feature 'View Links' do
  scenario 'View a list of links' do
    Link.create(url: 'https://www.google.co.uk/', title: 'Google')
    visit '/links'
    expect(page.status_code).to eq 200
    expect(page).to have_content 'Google'
    # expect(page).to have_link('Google', href: 'https://www.google.co.uk/')
  end
end
