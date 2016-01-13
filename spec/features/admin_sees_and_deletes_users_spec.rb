require 'rails_helper'

feature "admin sees a list of users" do
  context "visiting the home page" do
    let(:user) { FactoryGirl.create(:user) }
    let!(:admin) { FactoryGirl.create(:admin) }

    before do
      sign_in_as(admin)
      visit root_path
    end

    scenario "sees a list of users" do
      users.each do |user|
        expect(page).to have_link user.username
      end
    end
  end
end
