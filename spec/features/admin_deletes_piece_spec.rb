require 'rails_helper'

feature "admin deletes pieces" do
  context "visiting piece show page" do
    let(:dumpling_king) do
      Piece.create(title: 'Dumpling King', composer: "Tchackowskowitz")
    end

    scenario "admin deletes piece" do
      visit piece_path(dumpling_king)

      expect(page).to have_content "Delete Piece"

      click_link "Delete Piece"

      expect(page).to_not have_content "Dumpling King"
      expect(page).to_not have_content "Tchackowskowitz"
    end
  end
end
