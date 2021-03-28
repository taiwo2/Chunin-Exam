require "rails_helper"

RSpec.describe WebLink, type: :model do
  subject(:web_link) { build(:web_link) }

  describe "associations" do
    it { is_expected.to belong_to(:user) }
  end

  describe "validations" do
    it do
      expect(web_link).to allow_value(
        "https://goog.com", "https://www.hello.com", "http://gool.com", "http://www.googl.co.in"
      ).for(:original_url)
    end

    it { is_expected.not_to allow_value("https://goog", "www.hello.com").for(:original_url) }
  end

  describe "callbacks" do
    it "generates a random uid based on the original_url" do
      web_link.uid = ""
      web_link.save!

      expect(web_link.uid).to be_present
    end
  end
end
