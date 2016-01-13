require 'rails_helper'

feature "admin deletes review" do
  context "visiting piece show page" do
    let(:user) { FactoryGirl.create(:user) }
    let(:admin) { FactoryGirl.create(:admin) }
    let(:piece) { FactoryGirl.create(:piece, user: user) }
    let!(:review) { FactoryGirl.create(:review, piece: piece, user: user) }

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
