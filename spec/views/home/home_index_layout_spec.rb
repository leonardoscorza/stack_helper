require 'rails_helper'

describe "home/index.html.erb" do
  before do
    assign(:questions, [create(:question)])
    render template: "home/index", layout: "layouts/application"
  end

  it "displays 'project name'" do
    expect(rendered).to have_title("StackHelper")
  end
end
