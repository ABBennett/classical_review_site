require "rails_helper"

feature "review spec" do
  context "logged in user" do
    let(:user) { FactoryGirl.create(:user) }
    let!(:piece) { FactoryGirl.create(:piece, user: user) }

    before do
      sign_in_as(user)
    end

    scenario "create review on a piece" do
      visit piece_path(piece)
      choose('10')
      fill_in "Title", with: "Eh, it was alright."
      fill_in "Body", with: "You can probably skip this one. You can probably skip this one. You can probably skip this one. You can probably skip this one. You can probably skip this one."
      click_button "Add Review"

      expect(page).to have_content("Your review has been successfully added.")
    end
  end
end
