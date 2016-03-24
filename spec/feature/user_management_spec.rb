require 'web_helper'

feature 'User Management' do

  scenario 'user sign up page loads correctly' do
    visit '/sign_up/register'
    expect(page.status_code).to eq(200)
  end

  scenario 'when a user signs up, the User count increase by 1' do
    expect{ sign_up }.to change{ User.count }.by(1)
  end

  scenario 'after signing in, page diplays a welcome message' do
    sign_up
    expect(page).to have_content('Bookmarks for johnsmith@gmail.com')
  end

  scenario 'after sign up, email address is in DB' do
    sign_up
    user = User.first
    expect(user.email).to eq('johnsmith@gmail.com')
  end
end
