require 'rails_helper'

describe "Questions show view" do
  describe "Page title" do
    let(:question) { create(:question) }
    before do
      login_as create(:user)
      visit question_url(question)
    end

    it "displays 'question first tag - question title - project name'" do
      expect(page).to have_title("ruby - This is the question title - StackHelper")
    end
  end
end
