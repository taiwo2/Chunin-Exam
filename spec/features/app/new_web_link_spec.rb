require "rails_helper"

RSpec.describe "App::NewWebLinks", type: :feature do
  it "redirects to web_link show page after shortening the url" do
    user = create(:user)
    feature_sign_in(user)
    visit app_web_links_path
    within "#new_web_link", visible: false do
      fill_in "Website URL", with: "https://google.com", visible: false
      click_button "Shorten", visible: false
    end

    expect(page).to have_current_path(app_web_link_path(WebLink.first))
  end
end
