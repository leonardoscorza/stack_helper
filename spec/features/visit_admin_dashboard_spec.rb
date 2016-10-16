require 'rails_helper'

describe "Visit admin dashboard", type: :feature do
  subject { visit rails_admin.dashboard_path }

  context "whit a non admin user" do
    before do
      login_as create(:user)
      subject
    end

    it "redirects to root_path" do
      expect(page).to have_current_path(root_path)
    end
  end

  context "whit an admin user" do
    before do
      login_as create(:user, :admin)
      subject
    end

    it "displays the dashboard" do
      expect(page).to have_current_path(rails_admin.dashboard_path)
    end
  end
end
