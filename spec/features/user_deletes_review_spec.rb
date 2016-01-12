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

    context "On own piece" do
      scenario "user deletes review on own piece" do
        sign_in_as(user)
        visit piece_path(piece)
        click_link "Delete Review"

        expect(page).to_not have_content(review.title)
      end
    end

    context "On other users piece" do
      let!(:other_review) { FactoryGirl.create(:review, piece: piece, user: other_user) }

      scenario "user deletes review on other piece" do
        sign_in_as(other_user)
        visit piece_path(piece)
        click_link "Delete Review"

        expect(page).to_not have_content(other_review.title)
      end
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
