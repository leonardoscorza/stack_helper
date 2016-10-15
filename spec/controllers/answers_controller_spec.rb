require 'rails_helper'

RSpec.describe AnswersController, type: :controller do

  before(:each) do
    @question = FactoryGirl.create(:question)
  end

  # describe "POST #create" do
  #   subject(:post_with_valid_attributes) { post :create, params: { answer: attributes_for(:answer), question_id: @question }}
  #
  #   context "when looged-in" do
  #     before { sign_in create(:user) }
  #
  #     context "with valid attributes" do
  #       it "create new answer" do
  #         expect{ post_with_valid_attributes }.to change(Answer, :count).by(1)
  #       end
  #
  #       it "associate the answers to a user" do
  #         post_with_valid_attributes
  #         expect(assigns(:answer).user_id).to_not be_nil
  #       end
  #
  #       it "associate the answer to a question" do
  #         post_with_valid_attributes
  #         expect(assigns(:answer).question_id).to_not be_nil
  #       end
  #     end
  #   end
  # end

  describe "PUT #update" do
  end

  describe "DELETE #destroy" do
  end

end
