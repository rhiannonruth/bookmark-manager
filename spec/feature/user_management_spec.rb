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

  scenario 'entering mismatching passwords does not add user' do
    expect{sign_up_wrong_password}.not_to change(User, :count)
  end

  scenario 'entering mismatching passwords stays on page' do
    sign_up_wrong_password
    expect(current_path).to eq('/sign_up')
  end

  scenario 'entering mismatching passwords displays message' do
    sign_up_wrong_password
    expect(page).to have_content('Password does not match the confirmation')
  end

  scenario 'entering no email will not update database' do
    expect do
      visit '/sign_up/register'
      click_button 'Sign Up'
    end.not_to change(User, :count)
    expect(page).to have_content('Email must not be blank')
  end

  scenario 'entering invalid email will not update database' do
    expect do
      visit '/sign_up/register'
      fill_in 'email', with: 'johnsmithgmail.com'
      click_button 'Sign Up'
    end.not_to change(User, :count)
    expect(page).to have_content('Email has an invalid format')
  end

  scenario 'user must have unique email address to sign up' do
    sign_up
    expect{ sign_up }.not_to change{ User.count }
    expect(page).to have_content('Email is already taken')
  end
end
