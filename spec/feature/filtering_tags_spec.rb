feature 'filtering links by tag' do

  before(:each) do
    Link.create(link_address: 'http://www.makersacademy.com', link_name: 'Makers Academy', tags: [Tag.first_or_create(tag: 'education')])
    Link.create(link_address: 'http://www.google.com', link_name: 'Google', tags: [Tag.first_or_create(tag: 'search')])
    Link.create(link_address: 'http://www.zombo.com', link_name: 'This is Zombocom', tags: [Tag.first_or_create(tag: 'bubbles'),Tag.first_or_create(tag: 'fun')])
    Link.create(link_address: 'http://www.bubble-bobble.com', link_name: 'Bubble Bobble', tags: [Tag.first_or_create(tag: 'bubbles'),Tag.first_or_create(tag: 'fun')])
  end

  scenario 'filter links by first tag' do
    visit '/tags/bubbles'
    expect(page.status_code).to eq(200)
    within 'ul#links' do
      expect(page).not_to have_content('Makers Academy')
      expect(page).not_to have_content('Code.org')
      expect(page).to have_content('This is Zombocom')
      expect(page).to have_content('Bubble Bobble')
    end
  end

  scenario 'filter links by second tag' do
    visit '/tags/fun'
    expect(page.status_code).to eq(200)
    within 'ul#links' do
      expect(page).not_to have_content('Makers Academy')
      expect(page).not_to have_content('Code.org')
      expect(page).to have_content('This is Zombocom')
      expect(page).to have_content('Bubble Bobble')
    end
  end

end
