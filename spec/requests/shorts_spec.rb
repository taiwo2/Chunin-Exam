require 'rails_helper'

RSpec.describe "Shorts", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/shorts/show"
      expect(response).to have_http_status(:success)
    end
  end

end
