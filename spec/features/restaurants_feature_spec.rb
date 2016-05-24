require 'rails_helper'

feature 'restaurants' do
  context 'no restaurants has been added' do
    scenario 'should display a prompt to add a restaurant' do
      visit '/restaurants'
      expect(page).to have_content 'No restaurants yet'
      expect(page).to have_link 'Add a restaurant'
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
end