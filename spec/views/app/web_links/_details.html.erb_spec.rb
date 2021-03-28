require "rails_helper"

RSpec.describe "app/web_links/_details", type: :view do
  it "displays the web_link title" do
    web_link = create(:web_link)
    assign(:web_link, web_link)

    render

    expect(rendered).to have_text(web_link.title)
  end

  it "displays the web_link original title" do
    web_link = create(:web_link)
    assign(:web_link, web_link)

    render

    expect(rendered).to have_text(web_link.original_url)
  end

  it "displays the shortened url" do
    web_link = create(:web_link)
    assign(:web_link, web_link)

    render

    expect(rendered).to have_link(external_web_link_url(id: web_link.uid))
  end
end
