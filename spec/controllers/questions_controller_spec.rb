require 'rails_helper'

describe QuestionsController, type: :controller do
  describe "GET #index" do
    before { get :index }

    it "renders :index view" do
      expect(response).to render_template(:index)
    end

    it "assigns the requested object to @questions" do
      expect(assigns(:questions)).to eq(Question.all)
    end
  end

  describe "GET #edit" do
    let(:question) { create(:question) }
    subject { get :edit, params: { id: question, question: attributes_for(:question) } }

    context "when logged-in" do
      before do
        sign_in create(:user)
        subject
      end

      it "renders :edit view" do
        expect(response).to render_template(:edit)
      end

      it "assigns the requested object to @question" do
        expect(assigns(:question)).to eq(question)
      end
    end

    context "when not logged-in" do
      before { subject }

      it "redirects to sign-in page" do
        expect(response).to redirect_to(new_user_session_url)
      end
    end
  end

  describe "GET #show" do
    let(:question) { create(:question_with_answers) }
    before { get :show, params: { id: question } }

    it "renders :show view" do
      expect(response).to render_template(:show)
    end

    it "assigns the requested objects to @question and @answers" do
      expect(assigns(:question)).to eq(question)
      expect(assigns(:answers)).to eq(question.answers)
    end
  end

  describe "GET #new" do
    subject { get :new }

    context "when logged-in" do
      before do
        sign_in create(:user)
        subject
      end

      it "renders :new view" do
        expect(response).to render_template(:new)
      end

      it "makes available an empty question object" do
        expect(assigns(:question)).to be_a_new(Question)
      end
    end

    context "when not logged-in" do
      before { subject }

      it "redirects to sign-in page" do
        expect(response).to redirect_to(new_user_session_url)
      end
    end
  end

  describe "POST #create" do
    subject(:post_with_valid_attributes) { post :create,
             params: { question: attributes_for(:question) } }

    context "when logged-in -->" do
      before { sign_in create(:user) }

      context "whit valid attributes" do
        it "creates a new question" do
          expect{ post_with_valid_attributes }.to change(Question, :count).by(1)
        end

        it "associate the question to a user" do
          post_with_valid_attributes
          expect(assigns(:question).user_id).to_not be_nil
        end

        it "redirects to the new question" do
          post_with_valid_attributes
          expect(response).to redirect_to(Question.last)
        end
      end

      context "whit invalid attributes" do
        subject(:post_with_invalid_attributes) { post :create,
                params: { question: attributes_for(:question, :invalid) } }

        it "does not save the new question" do
          expect{ post_with_invalid_attributes }.to_not change(Question, :count)
        end

        it "renders the new template" do
          post_with_invalid_attributes
          expect(response).to render_template(:new)
        end
      end
    end

    context "when not logged-in" do
      before { post_with_valid_attributes }

      it "redirects to sign-in page" do
        expect(response).to redirect_to(new_user_session_url)
      end
    end
  end

  describe "PUT #update" do
    context "when logged-in -->" do
      before { sign_in create(:user) }
      let(:question) { create(:question) }

      context "whit valid attributes" do
        subject { put :update, params: { id: question,
                  question: attributes_for(:question, title: "New title") } }

        it "finds the requested question" do
          subject
          expect(assigns(:question)).to eq(question)
        end

        it "updates question attributes" do
          subject
          expect(question.reload.title).to eq("New title")
        end

        it "redirects to the question" do
          subject
          expect(response).to redirect_to(question)
        end
      end

      context "whit invalid attributes" do
        before { put :update, params: { id: question, question: attributes_for(:question, :invalid) } }

        it "does not update question attributes" do
          # "to_not be_nil" because invalid question factory is setting title = nil.
          expect(question.reload.title).to_not be_nil
        end

        it "renders the new template" do
          expect(response).to render_template(:edit)
        end
      end
    end

    context "when not logged-in" do
      before { put :update, params: { id: create(:question),
                question: attributes_for(:question, title: "New title") } }

      it "redirects to sign-in page" do
        expect(response).to redirect_to(new_user_session_url)
      end
    end
  end

  describe "DELETE #destroy" do
    let!(:question) { create(:question) }
    subject { delete :destroy, params: { id: question } }

    context "when logged-in" do
      before { sign_in create(:user) }

      it "deletes the question" do
        expect { subject }.to change(Question, :count).by(-1)
      end

      it "redirects to index view" do
        subject
        expect(response).to redirect_to(questions_url)
      end
    end

    context "when not logged-in" do
      before { subject }

      it "redirects to sign-in page" do
        expect(response).to redirect_to(new_user_session_url)
      end
    end
  end
end
