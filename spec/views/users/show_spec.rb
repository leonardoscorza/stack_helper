require 'rails_helper'

describe "users/show.html.erb", type: :view do
  before do
    assign(:user, build(:user))
    render template: "users/show", layout: "layouts/application"
  end

  it "displays 'user name - project name'" do
    expect(rendered).to have_title("User - StackHelper")
  end
end
