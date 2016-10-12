require 'rails_helper'

describe QuestionsController, type: :controller do
  describe "GET #edit" do
    let(:question) { create(:question) }
    before do
      sign_in create(:user)
      get :edit, params: { id: question, question: attributes_for(:question) }
    end

    it "render :edit view" do
      expect(response).to render_template(:edit)
    end

    it "assigns the requested object to @question" do
      expect(assigns(:question)).to eq(question)
    end
  end

  describe "GET #show" do
    let(:question) { create(:question_with_answers) }
    before { get :show, params: { id: question } }

    it "render :show view" do
      expect(response).to render_template(:show)
    end

    it "assigns the requested objects to @question and @answers" do
      expect(assigns(:question)).to eq(question)
      expect(assigns(:answers)).to eq(question.answers)
    end
  end

  describe "GET #new" do
    before do
      sign_in create(:user)
      get :new
    end

    it "render :new view" do
      expect(response).to render_template(:new)
    end

    it "makes available an empty question object" do
      expect(assigns(:question)).to be_a_new(Question)
    end
  end

  describe "POST #create" do
    before { sign_in create(:user) }

    context "whit valid attributes" do
      it "creates a new question" do
        expect{ post :create, params:
          { question: attributes_for(:question) } }.to change(Question, :count).by(1)
      end

      it "associa the question to a user" do
        post :create, params: { question: attributes_for(:question) }
        expect(assigns(:question).user_id).to_not be_nil
      end
    end

    context "whit invalid attributes" do
      it "does not save the new question" do
        expect{ post :create, params: { question:
          attributes_for(:question, :invalid) } }.to_not change(Question, :count)
      end
    end
  end

  describe "PUT #update" do
    before { sign_in create(:user) }
    let(:question) { create(:question) }

    context "whit valid attributes" do
      it "find the requested question" do
        put :update, params: { id: question, question: attributes_for(:question) }
        expect(assigns(:question)).to eq(question)
      end

      it "update question attributes" do
        put :update, params: { id: question, question: attributes_for(:question, title: "New title") }
        expect(question.reload.title).to eq("New title")
      end
    end

    context "whit invalid attributes" do
      before { put :update, params: { id: question, question: attributes_for(:question, :invalid) } }

      it "does not update question attributes" do
        # "to_not be_nil" because invalid question factory is seting title = nil.
        expect(question.reload.title).to_not be_nil
      end
    end
  end

  describe "DELETE #destroy" do
    before { sign_in create(:user) }
    let!(:question) { create(:question) }

    it "deletes the question" do
      expect { delete :destroy, params: { id: question } }.to change(Question, :count).by(-1)
    end
  end
end
