require 'rails_helper'

feature "non-signed-in user fails to edit or delete pieces" do
  context "visiting piece show page" do
    let(:user) { FactoryGirl.create(:user) }
    let!(:piece) { FactoryGirl.create(:piece, user: user) }

    before do
      visit piece_path(piece)
    end

    scenario "non-signed-in cannot see edit or links" do

      expect(page).to_not have_content "Edit"
      expect(page).to_not have_content "Delete"


    end

    scenario "non-signed-in is presented with error when visiting edit path" do
      visit edit_piece_path(piece)

      expect(page.status_code).to eq(404)
    end
  end
end
