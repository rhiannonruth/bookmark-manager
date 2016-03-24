def sign_up
  visit '/sign_up/register'
  fill_in 'email', with: 'johnsmith@gmail.com'
  fill_in 'password', with: 'abc123'
  fill_in 'password_confirmation', with: 'abc123'
  click_button 'Sign Up'
end

def sign_up_wrong_password
  visit '/sign_up/register'
  fill_in 'email', with: 'johnsmith@gmail.com'
  fill_in 'password', with: 'abc123'
  fill_in 'password_confirmation', with: 'abcdef'
  click_button 'Sign Up'
end
