require "rails_helper"

RSpec.describe WebLinkPolicy, type: :policy do
  describe "authorize test web_link states" do
    subject { described_class.new(user, web_link) }

    let(:user) { create(:user) }

    context "when being the current_user" do
      let(:web_link) { create(:web_link, user: user) }

      it { is_expected.to permit_actions(%i[show update destroy]) }
    end

    context "when not being the current_user" do
      let(:web_link) { create(:web_link) }

      it { is_expected.to forbid_actions(%i[show update destroy]) }
    end
  end
end
