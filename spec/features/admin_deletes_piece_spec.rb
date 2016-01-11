require 'rails_helper'

feature "admin deletes pieces" do
  context "visiting piece show page" do
    let(:user) { FactoryGirl.create(:user) }
    let(:admin) { FactoryGirl.create(:admin) }
    let!(:piece) { FactoryGirl.create(:piece, user: user) }

    before do
      sign_in_as(admin)
      visit piece_path(piece)
    end

    scenario "admin sees delete button for piece" do
      expect(page).to have_content "Delete Piece"
    end

    scenario "admin successfully deletes piece" do
      click_link "Delete Piece"
      expect(page).to_not have_content piece.title
    end
  end
end
