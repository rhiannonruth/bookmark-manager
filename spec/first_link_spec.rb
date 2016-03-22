feature 'links page' do

  scenario 'first page has a default link' do
    visit '/'
    expect(page).to have_link 'pizza'
  end

end
