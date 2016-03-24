def sign_up
  visit '/sign_up/register'
  fill_in 'email', with: 'johnsmith@gmail.com'
  fill_in 'password', with: 'abc123'
  click_button 'Sign Up'
end
