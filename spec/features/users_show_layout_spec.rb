require 'rails_helper'

describe "Home index view" do
  describe "Page title" do
    let(:user) { create(:user) }
    before do
      login_as user
      visit user_url(user)
    end

    it "displays 'project name'" do
      expect(page).to have_title("StackHelper")
    end
  end
end
