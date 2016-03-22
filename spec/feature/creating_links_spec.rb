feature 'adding links' do

  feature 'moving from the links page to the add link page' do

    before :each do
      visit '/links'
    end

    scenario 'links page has a button to access a form for adding links' do
      expect(page).to have_button 'Add Link'
    end

    scenario 'clicking the add link button will take to the form' do
      click_button 'Add Link'
      expect(page.current_path).to eq '/links/new'
    end

  end


  feature 'adding a link through the form' do

    before :each do
      visit '/links'
      click_button 'Add Link'
    end

    scenario 'links page has a form to add a link address' do
      expect(page).to have_field 'link_address'
    end

    scenario 'links page has a form to add a link description' do
      expect(page).to have_field 'link_name'
    end

    scenario 'links page has a button to memorize the data' do
      expect(page).to have_button 'Memorize Bookmark'
    end

    xscenario 'links added by the user shows up in the links page' do
      expect(page).to have_link 'TODO'
    end

  end


end
