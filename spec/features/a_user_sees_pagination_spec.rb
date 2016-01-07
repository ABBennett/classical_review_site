require 'rails_helper'


feature "pagination" do
  context "visiting index page with many pieces" do
    let(:user) { FactoryGirl.create(:user) }
    let!(:pieces) { FactoryGirl.create_list(:piece, 100, user: user) }

    scenario "user sees correct number of pieces on page" do
      visit root_path
      expect(page).to have_content pieces[9].title

      expect(page).to_not have_content pieces[10].title
    end
    scenario "user visits page by page number" do
      visit root_path

      click_link "3"
      expect(page).to have_content pieces[21].title
      click_link "2"
      expect(page).to have_content pieces[11].title
    end

    scenario "user navigates pages using next, back, first, and last buttons" do

      visit root_path

      click_link "Next"

      expect(page).to have_content pieces[11].title


      click_link "Prev"

      expect(page).to have_content pieces[9].title

      click_link "Last"

      expect(page).to have_content pieces[99].title

      click_link "First"

      expect(page).to have_content pieces[9].title
    end
  end
end
