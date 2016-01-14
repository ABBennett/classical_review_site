feature "send an email when a piece is reviewed" do
  let(:user) { FactoryGirl.create(:user) }
  let(:piece) { FactoryGirl.create(:piece, user: user) }

  context "signed in user sends an email on review" do
    before do
      sign_in_as(user)
      visit piece_path(piece)
    end
    scenario "user sends email successfully" do
      fill_in 'Title', with: "It's Amazing"
      fill_in 'Body', with: "The driving force, of course is universal in this opera that is essentially a battle of the sexes and a bedroom farce. The “revolutionary” politics of Beaumarchais’ work is largely expunged, aside from a brief mention that the royals no longer have the right to demand sexual favors from their servants. The music is glorious, particularly as the story darkens in the work’s second half. But a little of this sort of farce and froth goes a very long way. And at Lyric Opera, where the 2015-2016 season opened Saturday with an elaborate new production directed by Barbara Gaines (founder and artistic director of the Chicago Shakespeare Theater), the comic frolicking grows tiresome, and the real pain of betrayal emerges only fitfully."
      choose('10')
      click_button 'Add Review'

      expect(page).to have_content "Your review has been successfully added"
      expect(page).to have_content "It's Amazing"
      expect(page).to have_content "The driving force, of course is universal"
      expect(ActionMailer::Base.deliveries.count).to eq(1)
    end
  end
end
