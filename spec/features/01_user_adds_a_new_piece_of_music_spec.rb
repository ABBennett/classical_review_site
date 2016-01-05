require "rails_helper"
  def dummy_data
    fill_in 'Title', with: "Marriage of Figaro"
    fill_in 'Composer', with: "Mozart"
  end

feature "users can add a new piece of music" do
  scenario "user adds new piece of music successfully" do

    visit new_piece_path
    expect(page).to have_content "Add New Music"
    dummy_data
    click_button "Add Piece"

    expect(page).to have_content "Piece added successfully"
    # expect(page).to have_content "Marriage of Figaro"
    # expect(page).to have_content "Mozart"
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
