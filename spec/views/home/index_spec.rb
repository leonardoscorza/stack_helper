require 'rails_helper'

describe "home/index.html.erb", type: :view do
  before do
    assign(:questions, [create(:question)])
    render template: "home/index", layout: "layouts/application"
  end

  describe "Title tag" do
    it "displays 'project name'" do
      expect(rendered).to have_title("StackHelper")
    end
  end

  describe "Meta description" do
    it "displays default description" do
      meta_description = 'O StackHelper é uma comunidade online voltada para programadores, com o objetivo de dividir conhecimento e, até mesmo, permitir que você seja recompensado ($) por isso.'
      expect(rendered).to have_selector("meta[name='description'][content='#{meta_description}']",
                                        visible: false)
    end
  end
end
