require "rails_helper"

RSpec.describe "SignOuts", type: :feature do
  it "redirects to sign in page after signing out" do
    feature_sign_in
    visit app_web_links_path
    click_link "Sign out"

    expect(page).to have_current_path(new_session_path)
  end
end
