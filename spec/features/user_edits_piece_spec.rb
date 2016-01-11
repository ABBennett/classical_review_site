feature "user edits a piece" do
  let(:user) { FactoryGirl.create(:user) }
  let!(:piece) { FactoryGirl.create(:piece, user: user) }

  context "non-signed-in user cannot edit a piece" do
    before do
      visit piece_path(piece)
    end

    scenario "non-signed-in cannot see edit link" do
      expect(page).to_not have_content "Edit"
    end

    scenario "non-signed-in is presented with error when visiting edit path" do
      visit edit_piece_path(piece)

      expect(page).to have_content "You need to sign in or sign up before continuing."
      expect(page).to_not have_content(piece.title)
    end
  end

  context "signed in user editing own piece" do
    before do
      sign_in_as(user)
      visit piece_path(piece)
      click_link "Edit"
    end

    scenario "signed in user sucessfully edits own piece" do

      expect(page).to have_content "Edit"

      fill_in 'Title', with: "Marriage of Figaro"
      fill_in 'Composer', with: "Mozart"
      click_button "Edit"

      expect(page).to have_content "Marriage of Figaro"
      expect(page).to have_content "Mozart"
    end

    scenario "user does not fill in correct information" do
      fill_in 'Title', with: ""
      fill_in 'Composer', with: ""

      click_button "Edit"
      expect(page).to have_content "Title can't be blank"
    end
  end

  context "signed in user tries to edit someone elses piece" do
    let(:user2) { FactoryGirl.create(:user) }

    before do
      sign_in_as(user2)
    end

    scenario "signed in user cannot see edit button for other users piece" do
      visit piece_path(piece)
      expect(page).to_not have_content("Edit Piece")
    end

    scenario "signed in user is presented with error when visiting edit path for other user's piece" do
      visit edit_piece_path(piece)

      expect(page).to have_content "You can only edit a piece you created"
    end
  end
end
