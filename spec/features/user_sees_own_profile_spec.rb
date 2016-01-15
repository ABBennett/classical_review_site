require 'rails_helper'

feature 'user sees profile' do
  let(:user) { FactoryGirl.create(:user) }
  scenario 'user clicks name on topbar' do
    visit root_path
    sign_in_as(user)
    click_link "Signed in as #{user.username}"
    expect(page).to have_content(user.email)

  end
end
