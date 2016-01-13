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
    end
  end

  context "logged in user" do
    before do
      sign_in_as(user)
    end

    scenario "user succesfully votes a review" do
      visit piece_path(piece)

      click_link '+'

      expect(page).to have_content "Your review has been successfully added"
      expect(page).to have_content "It's Amazing"
      expect(page).to have_content "The driving force, of course is universal"

    end

    scenario "user does not choose a rating" do
      visit piece_path(piece)
      click_button "Add Review"

      expect(page).to have_content "Please choose a rating"
    end

    scenario "user writes a title over 50 characters long" do
      visit piece_path(piece)

      title = "a" * 101
      choose("9")
      fill_in 'Title', with: title
      click_button "Add Review"

      expect(page).to have_content "Titles need to be under 100 characters"
    end

    scenario "user writes a body under 50 characters long" do
      visit piece_path(piece)

      body = "a" * 49
      choose("9")
      fill_in 'Body', with: body
      click_button "Add Review"

      expect(page).to have_content "Reviews need to be at least 50 characters"
    end

    scenario "user writes a body over 5000 characters long" do
      visit piece_path(piece)

      body = "a" * 5001
      choose("9")
      fill_in 'Body', with: body
      click_button "Add Review"

      expect(page).to have_content "Reviews need to be under 5000 characters"
    end
  end
end
