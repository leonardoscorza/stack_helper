require 'rails_helper'

describe "questions/show.html.erb", type: :view do
  before do
    # question must be created (instead builded) because the hashtags are used
    # in show view, and they are created only when the question is saved.
    assign(:question, create(:question))
    assign(:user, build(:user))
    assign(:answer, build(:answer))
    render template: "questions/show", layout: "layouts/application"
  end

  it "displays 'question first tag - question title - project name'" do
    expect(rendered).to have_title("ruby - This is the question title - StackHelper")
  end
end
