require "rails_helper"

RSpec.describe "App::WebLinks", type: :request do
  describe "#create" do
    it "creates web link if request is valid" do
      user = create(:user)
      sign_in(user)
      post app_web_links_path, params: { web_link: { original_url: "https://abeidahmed.me" } }

      expect(user.web_links.count).to eq(1)
      expect(WebLink.first.title).to be_present
      expect(WebLink.first.uid).to be_present
    end

    it "throws error if request is invalid" do
      user = create(:user)
      sign_in(user)
      post app_web_links_path, params: { web_link: { original_url: "" } }

      expect(json.dig(:errors, :original_url)).to be_present
    end
  end

  describe "#update" do
    it "updates the web_link title" do
      user = create(:user)
      web_link = create(:web_link, user: user)
      sign_in(user)
      patch app_web_link_path(web_link), params: { web_link: { title: "New title" } }

      expect(web_link.reload.title).to eq("New title")
    end
  end

  describe "#destroy" do
    it "destroys the web_link" do
      user = create(:user)
      web_link = create(:web_link, user: user)
      sign_in(user)
      delete app_web_link_path(web_link)

      expect { WebLink.find(web_link.id) }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
