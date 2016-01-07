require 'rails_helper'

feature "visitor sees a list of pieces" do
  context "visiting the home page" do
    let(:user) do
      FactoryGirl.create(:user)
    end

    let!(:pieces) { FactoryGirl.create_list(:piece, 2, user: user) }

    before do
      sign_in_as(user)
      visit root_path
    end

    scenario "sees a list of pieces and link for new Piece" do
      expect(page).to have_content pieces[0].title
      expect(page).to have_link pieces[1].title

      click_link "Add New Piece"

      expect(page).to have_content "Add New Music"
    end

    scenario "clicks link and is taken to show page for given Piece" do
      click_link pieces[0].title

      expect(page).to have_content pieces[0].title
      expect(page).to have_content pieces[0].composer
    end
  end
end
