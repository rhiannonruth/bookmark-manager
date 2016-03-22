feature 'links page' do

  scenario 'first page has a default link' do
    visit '/'
    expect(page).to have_link 'first_link'
  end

end
