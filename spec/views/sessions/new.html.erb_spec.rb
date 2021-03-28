require "rails_helper"

RSpec.describe "sessions/new", type: :view do
  it "has the sign up link" do
    render
    expect(rendered).to have_link("Sign up", href: new_user_path)
  end
end
