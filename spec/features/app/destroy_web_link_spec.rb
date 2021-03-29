require "rails_helper"

RSpec.describe "App::DestroyWebLinks", type: :feature do
  it "redirects to web_links path after deleting" do
    user = create(:user)
    web_link = create(:web_link, user: user)
    feature_sign_in(user)
    visit app_web_link_path(web_link)
    page.find("#delete-web-link", visible: false).click

    expect(page).to have_current_path(app_web_links_path)
  end
end
