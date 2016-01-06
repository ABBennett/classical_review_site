require 'rails_helper'
feature "pagination" do
  context "visiting index page with many pieces" do
    before do
      visit new_piece_path
      100.times do
        piece = FactoryGirl.create(:piece)
        fill_in 'Title', with: piece.title
        fill_in 'Composer', with: piece.composer

        click_button "Add Piece"
      end
    end

    scenario "user sees correct number of pieces on page" do

      visit root_path
      expect(page).to have_content "Opus10"
      expect(page).to_not have_content "Opus11"
    end
    scenario "user visits page by page number" do
      visit root_path
      click_link "3"
      expect(page).to have_content "Opus121"
      click_link "2"
      expect(page).to have_content "Opus111"
    end

    scenario "user navigates pages using next, back, first, and last buttons" do
      visit root_path
      click_link "Next"

      expect(page).to have_content "Opus211"

      click_link "Prev"

      expect(page).to have_content "Opus210"

      click_link "Last"

      expect(page).to have_content "Opus299"

      click_link "First"

      expect(page).to have_content "Opus210"
    end
  end
end
