require "rails_helper"

RSpec.describe "SignIns", type: :feature do
  it "redirects to app_web_links_path after signing in" do
    user = create(:user)
    visit new_session_path
    fill_in "Email address", with: user.email_address
    fill_in "Password", with: user.password
    click_button "Sign in"

    expect(page).to have_current_path(app_web_links_path)
  end
end
