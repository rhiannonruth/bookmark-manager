feature 'user signs up' do

  scenario 'user enters name' do
    visit '/signup'
    expect(page).to have_field 'name'
  end

  scenario 'user enters email' do
    visit '/signup'
    expect(page).to have_field 'email'
  end

  scenario 'user enters password' do
    visit '/signup'
    expect(page).to have_field 'password'
  end

  scenario 'user is recorded' do
    visit '/signup'
    fill_in 'name', with: 'Rhiannon'
    fill_in 'email', with: 'rhiannon@butt.com'
    fill_in 'password', with: 'password'
    expect{click_button 'submit'}.to change{User.count}.by(1)
  end
end
