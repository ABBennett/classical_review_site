require "rails_helper"

feature "users can add a new review for a piece of music" do
  before do
    piece = FactoryGirl.create(:piece)
    visit piece_path(piece)
  end

  scenario "user adds new review of music successfully" do
    add_review
    click_button 'Add Review'

    expect(page).to have_content "Your review has been successfully added"
    expect(page).to have_content "It's Amazing"
    expect(page).to have_content "The driving force, of course is universal"

  end

  scenario "user does not choose a rating" do
    click_button "Add Review"

    expect(page).to have_content "Please choose a rating"
  end

  scenario "user writes a title over 50 characters long" do
    title = "a" * 101
    choose("9")
    fill_in 'Title', with: title
    click_button "Add Review"

    expect(page).to have_content "Titles need to be under 100 characters"
  end

  scenario "user writes a body under 50 characters long" do
    body = "a" * 49
    choose("9")
    fill_in 'Body', with: body
    click_button "Add Review"

    expect(page).to have_content "Reviews need to be at least 50 characters"
  end

  scenario "user writes a body over 5000 characters long" do
    body = "a" * 5001
    choose("9")
    fill_in 'Body', with: body
    click_button "Add Review"

    expect(page).to have_content "Reviews need to be under 5000 characters"
  end


end
