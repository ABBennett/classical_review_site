require 'rails_helper'

feature "profile photo" do
  scenario "user uploads a profile photo" do
    visit root_path
    click_link "Sign Up"

    fill_in 'Username', with: 'Jon'
    fill_in 'Email', with: 'user@example.com'
    fill_in 'user_password', with: 'password'
    fill_in 'Password Confirmation', with: 'password'
    attach_file "Profile photo", "#{Rails.root}/spec/support/images/jasper.png"
    click_button "Sign Up"

    expect(page).to have_content("You're in!")

    visit users_path
    click_link 'Jon'
    expect(page).to have_css("img[src*='jasper.png']")
  end
end
