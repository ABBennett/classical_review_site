require "rails_helper"

feature "non-signed-in users cannot add a new piece of music" do
  scenario "non-signed-in user tries to submit piece with correct information" do
    visit new_piece_path
    expect(page).to have_content "Add New Music"
    fill_in 'Title', with: "Marriage of Figaro"
    fill_in 'Composer', with: "Mozart"
    click_button "Add Piece"
    expect(page).to have_content "Please sign in to add a piece of music"

    visit root_path
    expect(page).to_not have_content "Marriage of Figaro"
  end
end
