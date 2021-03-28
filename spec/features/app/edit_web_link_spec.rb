require "rails_helper"

RSpec.describe "App::EditWebLinks", type: :feature do
  it "redirects to web_link show page after editing" do
    user = create(:user)
    web_link = create(:web_link, user: user)
    feature_sign_in(user)
    visit app_web_link_path(web_link)
    within "#web_link_#{web_link.id}", visible: false do
      fill_in "web_link[title]", with: "Updated title", visible: false
      click_button "Save", visible: false
    end

    expect(page).to have_text("Updated title")
    expect(page).to have_current_path(app_web_link_path(web_link))
  end
end
