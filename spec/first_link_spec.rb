feature 'links page' do
  Link.create(link_address: "first_link", link_name: "this is the first link")
  
  scenario 'first page is actually loading' do
    visit '/'
    expect(page.status_code).to eq 200
  end

  scenario 'first page has a default link' do
    visit '/'
    expect(page).to have_link 'first_link'
  end


end
