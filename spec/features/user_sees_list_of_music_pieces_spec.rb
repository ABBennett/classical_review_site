require 'rails_helper'

feature "visitor sees a list of pieces" do
  context "visiting the home page" do
    let(:user) { FactoryGirl.create(:user) }
    let!(:pieces) { FactoryGirl.create_list(:piece, 2, user: user) }

    before do
      sign_in_as(user)
      visit root_path
    end

    scenario "sees a list of pieces" do
      pieces.each do |piece|
        expect(page).to have_link piece.title
        expect(page).to have_content piece.composer
      end
    end
  end
end
