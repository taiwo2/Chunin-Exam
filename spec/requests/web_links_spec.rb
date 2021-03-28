require "rails_helper"

RSpec.describe "WebLinks", type: :request do
  describe "#create" do
    it "creates web link if request is valid" do
      user = create(:user)
      sign_in(user)
      post web_links_path, params: { web_link: { original_url: "https://abeidahmed.me" } }

      expect(user.web_links.count).to eq(1)
      expect(WebLink.first.title).to be_present
      expect(WebLink.first.uid).to be_present
    end

    it "throws error if request is invalid" do
      user = create(:user)
      sign_in(user)
      post web_links_path, params: { web_link: { original_url: "" } }

      expect(json.dig(:errors, :original_url)).to be_present
    end
  end
end
