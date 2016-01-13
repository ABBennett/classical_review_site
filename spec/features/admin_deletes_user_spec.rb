require 'rails_helper'

feature "admin deletes users" do
  context "visiting user index page" do
    let!(:bad_user) { FactoryGirl.create(:user) }
    let!(:good_user) { FactoryGirl.create(:user) }
    let(:admin) { FactoryGirl.create(:admin) }

    before do
      sign_in_as(admin)
      visit users_path
    end

    scenario "admin successfully deletes a user" do
      click_link "Delete #{bad_user.username}"
      expect(page).to_not have_content bad_user.username
      expect(page).to have_content good_user.username
    end
  end

  context "user cannot delete users" do
    let!(:bad_user) { FactoryGirl.create(:user) }

    before do
      sign_in_as(bad_user)
      visit users_path
    end

    scenario "user cannot see page" do
      expect(page).to have_content "The page you were looking for doesn't exist."
    end
  end
end
