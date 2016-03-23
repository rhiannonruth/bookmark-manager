feature 'filtering links by tag' do
  scenario 'filter links by tag' do
    visit '/tags/bubbles'
    links = Link.all?
    links.each do |link|
      expect(link.tags.map(&:tag)).to include('bubbles')
    end
  end
end
