require 'rails_helper'

describe "Home index view" do
  describe "Page title" do
    before do
      login_as create(:user)
      visit home_index_url
    end

    it "displays 'project name'" do
      expect(page).to have_title("StackHelper")
    end
  end
end
