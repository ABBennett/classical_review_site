require 'rails_helper'

feature "admin deletes pieces" do
  context "visiting piece show page" do
    let(:user) { FactoryGirl.create(:user) }
    let(:piece) { FactoryGirl.create(:piece, user: user) }

    scenario "admin deletes piece" do
      sign_in_as(user)
      visit piece_path(piece)
      expect(page).to have_content "Delete"

      click_link "Delete"

      expect(page).to_not have_content piece.title
      expect(page).to_not have_content piece.composer
    end
  end
end
