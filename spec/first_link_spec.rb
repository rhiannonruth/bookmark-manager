feature 'links page' do

  scenario 'first page has a default link' do
    visit '/'
    expect(page).to have_link 'first_link'
  end

  scenario 'can extract links from database(datamapper works)' do
    visit '/'
    click_link 'first_link'
    expect(current_path).to eq('/first_link')
  end

end
