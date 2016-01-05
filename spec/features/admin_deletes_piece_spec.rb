require 'rails_helper'

feature "admin deletes pieces" do
  context "visiting piece show page" do
    before do
      dumpling_king = Piece.create(title: 'Dumpling King', composer: "Tchackowskowitz")

      visit piece_path(dumpling_king)
    end

    scenario "admin deletes piece" do
      expect(page).to have_content "Delete Piece"

      click_link "Delete Piece"

      expect(page).to_not have_content "Dumpling King"
      expect(page).to_not have_content "Tchackowskowitz"
    end
  end
end
