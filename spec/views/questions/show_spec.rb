require 'rails_helper'

describe "questions/show.html.erb", type: :view do
  # question must be created (instead builded) because the hashtags are used
  # in show view, and they are created only when the question is saved.
  let(:question) { create(:question) }
  before do
    assign(:question, question)
    assign(:user, build(:user))
    assign(:answer, build(:answer))
    render template: "questions/show", layout: "layouts/application"
  end

  describe "Title tag" do
    it "displays 'question first tag - question title - project name'" do
      expect(rendered).to have_title("ruby - This is the question title - StackHelper")
    end
  end

  describe "Meta description" do
    it "displays truncated question text" do
      meta_description = truncate_question_text(question.text)
      expect(rendered).to have_selector("meta[name='description'][content='#{meta_description}']",
                                        visible: false)
    end
  end
end
