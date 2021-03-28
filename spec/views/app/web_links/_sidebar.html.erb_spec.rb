require "rails_helper"

RSpec.describe "app/web_links/_sidebar", type: :view do
  it "lists all the web_links of the current_user" do
    user = create(:user)
    web_link = create(:web_link, user: user)

    render partial: "app/web_links/sidebar", locals: { current_user: user }

    expect(rendered).to have_link(web_link.title, href: app_web_link_path(web_link))
  end

  it "does not list other web_links" do
    user = create(:user)
    web_link = create(:web_link)

    render partial: "app/web_links/sidebar", locals: { current_user: user }

    expect(rendered).not_to have_link(web_link.title)
  end
end
