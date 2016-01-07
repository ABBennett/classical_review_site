require "rails_helper"

feature "users can add a new review for a piece of music" do
  let(:piece) do
    FactoryGirl.create(:piece)
  end

  context "not logged in user" do
    scenario "cannot write review" do
      visit piece_path(piece)
      click_button 'Add Review'

      expect(page).to have_content "Please sign in to add a review"
    end
  end

  context "logged in user" do
    let(:user) do
      FactoryGirl.create(:user)
    end

    before do
      sign_in_as(user)
    end

    scenario "user adds new review of music successfully" do
      visit piece_path(piece)

      fill_in 'Title', with: "It's Amazing"
      fill_in 'Body', with: "The driving force, of course is universal in this opera that is essentially a battle of the sexes and a bedroom farce. The “revolutionary” politics of Beaumarchais’ work is largely expunged, aside from a brief mention that the royals no longer have the right to demand sexual favors from their servants. The music is glorious, particularly as the story darkens in the work’s second half. But a little of this sort of farce and froth goes a very long way. And at Lyric Opera, where the 2015-2016 season opened Saturday with an elaborate new production directed by Barbara Gaines (founder and artistic director of the Chicago Shakespeare Theater), the comic frolicking grows tiresome, and the real pain of betrayal emerges only fitfully."
      choose('10')
      click_button 'Add Review'

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
