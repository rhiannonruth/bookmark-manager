require 'web_helper'

feature 'User sign out' do

  let(:user) do
    User.create(email: 'johnsmith@gmail.com',
                password: 'abc123',
                password_confirmation: 'abc123')
  end

  scenario 'user can sign out' do
    sign_in(email: user.email, password: user.password)
    click_button 'Sign Out'
    expect(page).to have_content("Goodbye!")
  end
end
