require 'rails_helper'

feature 'reviewing' do
  before { Restaurant.create name: 'KFC' }

  scenario "allows users to leave a review" do
    visit '/restaurants'
    click_link 'Review KFC'
    fill_in 'Thoughts', with: "Nothing special"
    select '3', from: 'Rating'
    click_button 'Leave Review'

    expect(page).to have_content("Nothing special")
    expect(current_path).to eq '/restaurants'
  end
end
