
require "rails_helper"

RSpec.describe Api::V1::ReviewsController, type: :controller do
  describe "POST /api/v1/reviews" do
    context "create" do
      let(:user) { FactoryGirl.create(:user) }
      let!(:piece) { FactoryGirl.create(:piece, user: user) }
      let!(:review) { FactoryGirl.create(:review, piece: piece, user: user) }

      it "creates a new review" do
        # review = build(:review)
        post :create, review: review.attributes
        expect(response).to have_http_status(:created)
        expect(response.header["Location"]).to match /\/api\/v1\/reviews/
      end

      it "returns 'not_found' if validations fail" do
        post :create, review: { title: "", body: "", piece_id: 0, rating: "", user_id: 0 }
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
