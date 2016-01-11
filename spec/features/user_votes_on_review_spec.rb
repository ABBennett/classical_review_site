require 'rails_helper'

feature 'up and down vote' do
  context 'visiting page as a user' do
    let(:user) { FactoryGirl.create(:user) }
    let(:piece) { FactoryGirl.create(:piece, user: user) }
    let!(:review) { FactoryGirl.create(:review, user: user, piece: piece) }

    before do
      sign_in_as(user)
    end

    scenario "user sees upvote and downvote" do
      visit piece_path(piece)
      expect(page).to have_content("+")
      expect(page).to have_content("-")
      expect(page).to_not have_css('span#big')
    end

    scenario "user votes on a review" do
      visit piece_path(piece)
      click_link "+"

      visit piece_path(piece)
      expect(page).to have_css('span#big')
      expect(page).to_not have_css
    end
  end
end
