require "rails_helper"

RSpec.describe "App::IndexWebLinks", type: :feature do
  it "redirects to the first web_link if current_user has web_links" do
    user = create(:user)
    web_link = create(:web_link, user: user)
    feature_sign_in(user)
    visit app_web_links_path

    expect(page).to have_current_path(app_web_link_path(web_link))
  end

  it "does not redirect to web_link path if current_user does not have web_links" do
    user = create(:user)
    feature_sign_in(user)
    visit app_web_links_path

    expect(page).to have_current_path(app_web_links_path)
  end
end
