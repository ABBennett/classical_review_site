require 'rails_helper'

feature "visitor sees a list of pieces" do
  context "visiting the home page" do
    let(:user) { FactoryGirl.create(:user) }
    let!(:pieces) { FactoryGirl.create_list(:piece, 2, user: user) }
    let!(:matching_piece) { FactoryGirl.create(:piece, title: "Candide Overture", composer: "Bernstein")}

    before do
      visit root_path
    end

    scenario "user successfully searches for a piece by title" do
      fill_in "keyword_search", with: pieces[0].title
      find("#keyword_search_button", visible: false).click
      save_and_open_page

      # fill_in "title_search", with: pieces[0].title
      # click_button "title_search_button"

      expect(page).to have_content pieces[0].title
      expect(page).to have_content pieces[0].composer
      expect(page).to_not have_content pieces[1].title
    end
    scenario "user successfully searches for a piece by composer" do
      fill_in "keyword_search", with: pieces[0].composer
      click_button "keyword_search_button"

      expect(page).to have_content pieces[0].composer
      expect(page).to have_content pieces[0].title
      expect(page).to_not have_content pieces[1].title
    end
    scenario "user submits a blank search" do
      fill_in "keyword_search", with: ""
      click_button "keyword_search_button"

      expect(page).to have_content "No results found"
    end
    scenario "user submits a search with no results" do
      fill_in "keyword_search", with: "Taylor Swift"
      click_button "keyword_search_button"

      expect(page).to have_content "No results found"
      expect(page).to_not have_content pieces[0].title
      expect(page).to_not have_content pieces[1].title
    end

    scenario "user submits a search with composer and title" do
      fill_in "keyword_search", with: "Candide Bernstein"
      click_button "keyword_search_button"

      expect(page).to have_content matching_piece.composer
      expect(page).to have_content matching_piece.title
      expect(page).to_not have_content pieces[0].title
      expect(page).to_not have_content pieces[1].title
    end

    scenario "user submits a search with beginning of composer's name" do
      fill_in "keyword_search", with: "Bern"
      click_button "keyword_search_button"

      expect(page).to have_content matching_piece.composer
      expect(page).to have_content matching_piece.title
      expect(page).to_not have_content pieces[0].title
      expect(page).to_not have_content pieces[1].title
    end
  end
end
