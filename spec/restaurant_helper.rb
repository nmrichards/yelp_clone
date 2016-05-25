def sign_up
  visit '/restaurants'
  click_link 'Sign up'
  fill_in 'Email', with: "batman@gmail.com"
  fill_in 'Password', with: "bananas"
  fill_in 'Password confirmation', with: "bananas"
  click_button 'Sign up'
end
