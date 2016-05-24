require 'rails_helper'

feature 'restaurants' do
  context 'no restaurants has been added' do
    scenario 'should display a prompt to add a restaurant' do
      visit '/restaurants'
      expect(page).to have_content 'No restaurants yet'
      expect(page).to have_link 'Add a new restaurant'
    end
  end

  context 'a restaurant has been added' do
    before(:each) do
      Restaurant.create(name: 'Papa John')
    end

    scenario 'display restaurants' do
      visit 'restaurants'
      expect(page).to have_content('Papa John')
      expect(page).not_to have_content('No restaurants yet')
    end
  end

  context 'adding a restaurant' do
    scenario 'prompting user to create a new restaurant through a form and then display the new restaurant' do
       visit '/restaurants'
       click_link 'Add a new restaurant'
       fill_in 'Name', with: 'Papa John'
       click_button 'Create Restaurant'
       expect(page).to have_content 'Papa John'
       expect(current_path).to eq '/restaurants'
    end
  end

  context 'viewing restaurants' do

    let!(:papa_john) { Restaurant.create(name:'Papa John') }
    scenario 'user should be able to click on the restaurant to view it' do
      visit '/restaurants'
      click_link 'Papa John'
      expect(page).to have_content 'Papa John'
      expect(current_path).to eq "/restaurants/#{papa_john.id}"
    end
  end
end