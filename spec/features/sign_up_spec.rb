require "rails_helper"

RSpec.describe "SignUps", type: :feature do
  it "redirects to root_path after signing up" do
    visit new_user_path
    fill_in "Email address", with: "hello@hello.com"
    fill_in "Password", with: "secretpassword"
    click_button "Create"

    expect(page).to have_current_path(root_path)
  end
end
