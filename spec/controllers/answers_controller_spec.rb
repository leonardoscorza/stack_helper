require 'rails_helper'

RSpec.describe AnswersController, type: :controller do

  describe "GET #index" do
    before { get :index }

    it "renders :index view" do
      expect(response).to render_template(:index)
    end
    it "assigns the resquest object to @answers" do
      expect(assigns(:answers)).to eq(Answer.all)
    end
  end

  describe "GET #new" do
    subject { get :new }

    context "when looged-in" do
      before do
        sign_in create(:user)
        subject
      end
      it "renders :new view" do
        expect(response).to render_template(:new)
      end
      it "makes available an empty answer object" do
        expect(assigns(:answer)).to be_a_new(Answer)
      end
    end
  end

  describe "POST #create" do
    subject(:post_with_valid_attributes) { post :create,
              params: { answer: attributes_for(:answer) } }

    context "when looged-in" do
      before { sign_in create(:user) }

      context "with valid attributes" do
        it "create new answer" do
          expect{ post_with_valid_attributes }.to change(Answer, :count).by(1)
        end

        it "associate the answers to a user" do
          post_with_valid_attributes
          expect(assigns(:answer).user_id).to_not be_nil
        end

        it "associate the answer to a question" do
          post_with_valid_attributes
          expect(assigns(:answer).question_id).to_not be_nil
        end
      end
    end
  end

  describe "GET #edit" do
  end

  describe "PUT #update" do
  end

  describe "DELETE #destroy" do
  end

  describe "GET #show" do
  end

end
