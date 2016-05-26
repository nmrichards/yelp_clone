feature "reviewing" do
  let!(:restaurant) { Restaurant.create name: "KFC" }

  scenario "allows users to leave a review using a form" do
     leave_review
     click_link "KFC Reviews"
     expect(current_path).to eq "/restaurants/#{restaurant.id}/reviews"
     expect(page).to have_content("so so")
  end

  describe "view reviews for each restaurant" do
    let(:user) { User.create email: "test@test.com" }
    let(:review_params) { {rating: 5, thoughts: "yum"} }
    let!(:review) { restaurant.reviews.create_with_user!(review_params, user) }

    scenario "view list of reviews for that restaurant" do
      visit "/restaurants"
      click_link "KFC Reviews"
      expect(page).to have_content("KFC")
      expect(current_path).to eq "/restaurants/#{restaurant.id}/reviews"
      expect(page).to have_content("yum")
    end

  end

  describe "deleting reviews" do
    scenario "delete my own review" do
      leave_review
      click_link "KFC Reviews"
      click_link "Delete so so"
      expect(page).not_to have_content "so so"
      expect(page).to have_content "Review deleted successfully"
    end

    describe "delete not my own review" do
      let(:user) { User.create email: "test@test.com" }
      let(:review_params) { {rating: 5, thoughts: "yum"} }
      let!(:review) { restaurant.reviews.create_with_user!(review_params, user) }
      scenario "doesn't delete the review" do
        sign_up
        visit "/restaurants"
        click_link "KFC Reviews"
        expect(page).not_to have_content "Delete yum"
      end
    end
  end

  def sign_up
    visit "/"
    click_link("Sign up")
    fill_in("Email", with: "test2@test.com")
    fill_in("Password", with: "testtest")
    fill_in("Password confirmation", with: "testtest")
    click_button("Sign up")
  end

  def leave_review
    visit "/restaurants"
    click_link "Review KFC"
    fill_in "Thoughts", with: "so so"
    select "3", from: "Rating"
    click_button "Leave Review"
  end

end
