require "rails_helper"

feature "users can add a new review for a piece of music" do
  let(:user) { FactoryGirl.create(:user) }
  let(:piece) { FactoryGirl.create(:piece, user: user) }
  let!(:review) { FactoryGirl.create(:review, user: user, piece: piece) }

  context "not logged in user" do
    scenario "cannot vote" do
      visit piece_path(piece)
      click_link '+'
      expect(page).to have_content "You need to sign in or sign up before continuing"

      visit piece_path(piece)
      click_link '-'
      expect(page).to have_content "You need to sign in or sign up before continuing"
    end
  end

  context "logged in user" do
    # other tests will be added when we add rank functionality
  end
end
