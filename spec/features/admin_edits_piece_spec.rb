require 'rails_helper'

feature "admin edits pieces" do
  context "visiting piece show page" do
    before do
      dumpling_king = Piece.create(title: 'Dumpling King', composer: "Tchackowskowitz")

      visit piece_path(dumpling_king)
      click_link "Edit"
    end

    scenario "admin sees edit form for piece" do

      expect(page).to have_content "Edit"

      fill_in 'Title', with: "Marriage of Figaro"
      fill_in 'Composer', with: "Mozart"
      click_button "Edit"

      expect(page).to have_content "Marriage of Figaro"
      expect(page).to have_content "Mozart"
    end

    scenario "admin does not fill in correct information" do
      fill_in 'Title', with: ""
      fill_in 'Composer', with: ""

      click_button "Edit"
      expect(page).to have_content "Title can't be blank"
    end
  end
end
