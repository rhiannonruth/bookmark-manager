feature 'adding tags' do
  scenario 'page has a link tag field' do
    visit '/links/new'
    expect(page).to have_field 'link_tag'
  end

  scenario 'link and tag are related' do
    visit '/links/new'
    fill_in 'link_name', with: 'ass'
    fill_in 'link_address', with: 'boob'
    fill_in 'link_tag', with: 'tag'
    click_button 'Memorize Bookmark'
    link = Link.first
    expect(link.tags.map(&:tag)).to include('tag')
  end

  scenario 'user can add multiple tags' do
    visit '/links/new'
    fill_in 'link_name', with: 'BBC News'
    fill_in 'link_address', with: 'http://www.bbc.co.uk/news'
    fill_in 'link_tag', with: 'news bbc'
    click_button 'Memorize Bookmark'
    link = Link.first
    expect(link.tags.map(&:tag)).to include('news', 'bbc')
  end
end
