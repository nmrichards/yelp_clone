feature "user sign up, sign in, sign out" do

  context "not signed in" do
    scenario "should see a 'sign in' link and a 'sign up' link on homepage" do
      visit("/")
      expect(page).to have_link("Sign in")
      expect(page).to have_link("Sign up")
    end

    scenario "should not see 'sign out' link on homepage" do
      visit("/")
      expect(page).not_to have_link("Sign out")
    end
  end

  context "user signed in" do
    before do
      visit("/")
      click_link("Sign up")
      fill_in("Email", with: "test@example.com")
      fill_in("Password", with: "testtest")
      fill_in("Password confirmation", with: "testtest")
      click_button("Sign up")
    end

    scenario "should see 'sign out' link on homepage" do
      visit("/")
      expect(page).to have_link("Sign out")
    end

    scenario "should not see a 'sign in' link and a 'sign up' link on homepage" do
      visit("/")
      expect(page).not_to have_link("Sign in")
      expect(page).not_to have_link("Sign up")
    end
  end
end
