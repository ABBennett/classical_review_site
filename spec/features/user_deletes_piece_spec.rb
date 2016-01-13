feature "user deletes a piece" do
  let(:user) { FactoryGirl.create(:user) }
  let!(:piece) { FactoryGirl.create(:piece, user: user) }

  context "signed-in user cannot delete a piece" do
    let(:user2) { FactoryGirl.create(:user) }

    scenario "signed in user cannot see delete button for piece he did not create" do
      sign_in_as(user2)

      visit piece_path(piece)
      expect(page).to_not have_content("Delete Piece")
    end

    scenario "signed in user cannot see delete button for piece he did create" do
      sign_in_as(user)

      visit piece_path(piece)

      expect(page).to_not have_content("Delete Piece")
    end
  end

  context "non-signed-in user fails to delete a piece" do
    before do
      visit piece_path(piece)
    end

    scenario "non-signed-in cannot see delete links" do
      expect(page).to_not have_content "Delete"
    end
  end
end
