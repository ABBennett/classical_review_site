require "rails_helper"

feature "users can add a new piece of music" do

  context "not logged in user" do
    scenario "does not see link to add a new piece of music" do
      visit root_path

      expect(page).to_not have_content("Add New Piece")
    end
  end

  context "logged in user" do
    let(:user) do
      FactoryGirl.create(:user)
    end

    before do
      sign_in_as(user)
    end

    scenario "user adds new piece of music successfully" do
      visit new_piece_path
      expect(page).to have_content "Add New Music"
      title_and_composer
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
      title_and_composer
      click_button "Add Piece"

      visit new_piece_path
      title_and_composer
      click_button "Add Piece"

      expect(page).to have_content
      "There should only be one title and composer pair"
    end
  end
end
