feature "restaurants" do
  before do
    visit("/")
    click_link("Sign up")
    fill_in("Email", with: "test@example.com")
    fill_in("Password", with: "testtest")
    fill_in("Password confirmation", with: "testtest")
    click_button("Sign up")
  end

  describe "viewing list of restaurants" do
    context "no restaurants have been added" do
      scenario "should display a prompt to add a restaurant" do
        visit "/restaurants"
        expect(page).to have_content "No restaurants yet"
        expect(page).to have_link "Add a restaurant"
      end
    end

    context "a restaurant has been added" do
      before do
        Restaurant.create(name: "KFC")
      end
      scenario "display restaurants" do
        visit "/restaurants"
        expect(page).to have_content("KFC")
        expect(page).not_to have_content("No restaurants yet")
      end
    end
  end

  describe "creating restaurants" do
    context "when user logged in" do
      scenario "prompts user to fill out a form to create a restaurant" do
        visit "/restaurants"
        click_link "Add a restaurant"
        fill_in "Name", with: "KFC"
        click_button "Create Restaurant"
        expect(page).to have_content "KFC"
        expect(current_path).to eq "/restaurants"
      end
    end

    context "when user not logged in" do
      scenario "don't show form to create a new restaurant" do
        click_link "Sign out"
        visit "/restaurants"
        click_link "Add a restaurant"
        expect(current_path).not_to eq "/restaurants/new"
      end
    end

  end

  describe "viewing restaurants" do
    let!(:kfc){ Restaurant.create(name:"KFC") }
    scenario "lets a user view a restaurant" do
      visit "/restaurants"
      click_link "KFC"
      expect(page).to have_content "KFC"
      expect(current_path).to eq "/restaurants/#{kfc.id}"
    end
  end

  describe "editing restaurants" do
    before do
      Restaurant.create name: "KFC", description: "Deep fried goodness"
    end
    scenario "let a user edit a restaurant" do
      visit "/restaurants"
      click_link "Edit KFC"
      fill_in "Name", with: "Kentucky Fried Chicken"
      fill_in "Description", with: "Deep fried goodness"
      click_button "Update Restaurant"
      expect(page).to have_content "Kentucky Fried Chicken"
      expect(page).to have_content "Deep fried goodness"
      expect(current_path).to eq "/restaurants"
    end
  end

  describe "deleting restaurants" do
    before do
      Restaurant.create name: "KFC", description: "Deep fried goodness"
    end
    scenario "removes a restaurant when a user clicks a delete link" do
      visit "/restaurants"
      click_link "Delete KFC"
      expect(page).not_to have_content "KFC"
      expect(page).to have_content "Restaurant deleted successfully"
    end
  end

  describe "an invalid restaurant" do
    scenario "does not let you submit a name that is too short" do
      visit "/restaurants"
      click_link "Add a restaurant"
      fill_in "Name", with: "kf"
      click_button "Create Restaurant"
      expect(page).not_to have_css "h2", text: "kf"
      expect(page).to have_content "error"
    end
  end

end
