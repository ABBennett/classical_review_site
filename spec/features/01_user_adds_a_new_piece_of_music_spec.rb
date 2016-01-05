require "rails_helper"
require "spec_helper"

feature "users can add a new piece of music" do
  scenario "user adds new piece of music successfully" do

    visit new_piece_path
    expect(page).to have_content "Add New Music"
    dummy_data
    click_button "Add Piece"

    expect(page).to have_content "Piece added successfully"

  end

  scenario "user does not provide proper information" do
    visit new_piece_path
    click_button "Add Piece"
    expect(page).to have_content "Title can't be blank"
  end

  scenario "user provides piece and composer pair already added" do
    visit new_piece_path
    dummy_data
    click_button "Add Piece"
    dummy_data
    click_button "Add Piece"

    expect(page).to have_content
    "There should only be one title and composer pair"
  end
end
