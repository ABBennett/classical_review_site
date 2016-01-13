require 'rails_helper'

feature "admin deletes review" do
  context "visiting piece show page" do
    let(:admin) { FactoryGirl.create(:admin) }
    let(:review) { FactoryGirl.create(:review) }
    let!(:piece) { review.piece }
    
    before do
      sign_in_as(admin)
      visit piece_path(piece)
    end

    scenario "admin successfully deletes review" do
      click_link "Delete Review"
      expect(page).to_not have_content review.title
    end
  end
end
