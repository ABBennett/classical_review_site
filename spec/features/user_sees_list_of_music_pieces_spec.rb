require 'rails_helper'

feature "visitor sees a list of pieces" do
  context "visiting the home page" do
    let(:user) do
      FactoryGirl.create(:user)
    end

    let!(:piece1) do
      Piece.create(title: 'Dumpling King', composer: "Tchackowskowitz", user: user)
    end

    let!(:piece2) do
      Piece.create(title: "Rock Bottom", composer: "Bach Rotten", user: user)
    end

    before do
      sign_in_as(user)
      visit root_path
    end

    scenario "sees a list of pieces and link for new Piece" do
      expect(page).to have_content "Rock Bottom"
      expect(page).to have_link "Dumpling King"

      click_link "Add New Piece"

      expect(page).to have_content "Add New Music"
    end

    scenario "clicks link and is taken to show page for given Piece" do
      click_link "Dumpling King"

      expect(page).to have_content "Dumpling King"
      expect(page).to have_content "Tchackowskowitz"
    end
  end
end
