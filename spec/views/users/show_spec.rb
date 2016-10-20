require 'rails_helper'

describe "users/show.html.erb", type: :view do
  before do
    assign(:user, build(:user))
    render template: "users/show", layout: "layouts/application"
  end

  describe "Title tag" do
    it "displays 'user name - project name'" do
      expect(rendered).to have_title("Usuário User - StackHelper")
    end
  end

  describe "Meta description" do
    it "displays users default description" do
      meta_description = "Usuário do StackHelper."
      expect(rendered).to have_selector("meta[name='description'][content='#{meta_description}']",
                                        visible: false)
    end
  end
end
