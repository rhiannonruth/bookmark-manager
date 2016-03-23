feature 'user stuff' do

  scenario 'there is a log in button' do
    visit '/'
    expect(page).to have_button 'log in'
  end

  scenario 'there is a sign up button' do
    visit '/'
    expect(page).to have_button 'sign up'
  end

end
