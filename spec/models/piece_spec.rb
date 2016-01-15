require 'rails_helper'

describe Piece do
  it { should have_valid(:title).when('John', 'Sally') }
  it { should_not have_valid(:title).when('', nil) }
  it { should have_valid(:composer).when('John', 'Sally') }
  it { should_not have_valid(:composer).when('', nil) }

  describe ".search_by_keywords" do
    let!(:pieces_not_matching) { FactoryGirl.create_list(:piece, 2) }
    let!(:piece_that_matches) { FactoryGirl.create(:piece, title: "Cool Serenade") }
    let!(:keyword_search) { "Serenade" }

    it "should return pieces whose title matches the query" do
      piece_results = Piece.search_by_keywords(keyword_search)
      expect(piece_results).to include(piece_that_matches)
      pieces_not_matching.each do |piece_not_matching|
        expect(piece_results).to_not include(piece_not_matching)
      end
    end
  end
end
