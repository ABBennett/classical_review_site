require 'rails_helper'

feature "admin edits pieces" do
  context "visiting piece show page" do
    let(:user) { FactoryGirl.create(:user) }
    let(:admin) { FactoryGirl.create(:admin) }
    let!(:piece) { FactoryGirl.create(:piece, user: user) }

    before do
      sign_in_as(admin)
      visit piece_path(piece)
      click_link "Edit Piece"
    end

    scenario "admin sees edit form for piece" do
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
