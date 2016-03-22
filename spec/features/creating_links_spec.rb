require 'spec_helper'

set_database

feature 'Creating Links' do
  scenario 'Creating a link' do
    visit '/links/new'
    fill_in :title, with: 'Amazon'
    fill_in :url, with: 'http://www.amazon.co.uk/'
    click_button 'Submit'
    expect(current_path).to eq '/links'
    expect(page).to have_content 'Amazon'
  end

  scenario 'adding a link with a tag' do
    visit '/links/new'
    fill_in :title, with: 'BBC News'
    fill_in :url, with: 'http://www.bbc.co.uk/news'
    fill_in :tag, with: 'news'
    click_button 'Submit'

    link = Link.first
    expect(link.tags.map(&:tag)).to include('news')
  end
end
