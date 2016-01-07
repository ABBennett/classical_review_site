require 'rails_helper'

feature "pagination" do
  context "visiting index page with many reviews" do
    let(:user) { FactoryGirl.create(:user) }

    let(:piece) { FactoryGirl.create(:piece, user: user) }

    let!(:reviews) do
      FactoryGirl.create_list(
        :review,
        100,
        user: user,
        piece: piece
      )
    end

    before do
      sign_in_as(user)
    end

    scenario "user sees correct number of reviews on page" do
      visit piece_path(piece)
      expect(page).to have_content reviews[9].title

      expect(page).to_not have_content reviews[10].title
    end

    scenario "user visits page by page number" do
      visit piece_path(piece)

      click_link "3"
      expect(page).to have_content reviews[21].title
      click_link "2"
      expect(page).to have_content reviews[11].title
    end

    scenario "user navigates pages using next, back, first, and last buttons" do
      visit piece_path(piece)

      click_link "Next"

      expect(page).to have_content reviews[11].title

      click_link "Prev"

      expect(page).to have_content reviews[9].title

      click_link "Last"

      expect(page).to have_content reviews[99].title

      click_link "First"

      expect(page).to have_content reviews[9].title
    end
  end
end
