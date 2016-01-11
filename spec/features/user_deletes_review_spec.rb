feature "user deletes a review" do
  let(:user) { FactoryGirl.create(:user) }
  let(:other_user) { FactoryGirl.create(:user) }
  let(:piece) { FactoryGirl.create(:piece, user: user) }
  let!(:review) { FactoryGirl.create(:review, piece: piece, user: user) }

  context "User is signed in " do
    scenario "user can see delete button for review he created" do
      sign_in_as(user)
      visit piece_path(piece)

      expect(page).to have_content("Delete Review")
    end

    scenario "user successfully deletes button review he created" do
      sign_in_as(user)
      visit piece_path(piece)
      click_link "Delete Review"

      expect(page).to_not have_content(review.title)
    end

    scenario "user cannot see delete button for review he did not create" do
      sign_in_as(other_user)

      visit piece_path(piece)

      expect(page).to_not have_content("Delete Review")
    end

  end

  context "non-signed-in user fails to delete a piece" do
    scenario "non-signed-in cannot see delete links" do
      visit piece_path(piece)
      expect(page).to_not have_content "Delete Review"
    end
  end
end
