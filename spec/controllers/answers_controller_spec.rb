require 'rails_helper'

RSpec.describe AnswersController, type: :controller do

  describe "GET #index" do
    before { get :index }

    it "renders :index view" do
      expect(response).to render_template(:index)
    end
  end

  describe "GET #new" do
  end

  describe "POST #create" do
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
