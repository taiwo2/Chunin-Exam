require "rails_helper"

RSpec.describe "WebLinksShows", type: :feature do
  it "displays the web link title" do
    user = create(:user)
    web_link = create(:web_link, user: user)
    feature_sign_in(user)
    visit app_web_link_path(web_link)

    expect(page).to have_text(web_link.title)
  end

  it "displays the web link shortened url" do
    user = create(:user)
    web_link = create(:web_link, user: user)
    feature_sign_in(user)
    visit app_web_link_path(web_link)

    within "#web-url-action" do
      expect(page).to have_link(external_web_link_url(id: web_link.uid))
    end
  end
end
