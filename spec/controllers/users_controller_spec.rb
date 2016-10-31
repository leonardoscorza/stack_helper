require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #show" do
    let(:user) { create(:user) }
    before { get :show, params: { id: user } }

    it "renders :show view" do
      expect(response).to render_template(:show)
    end

    it "assigns the requested object to @user" do
      expect(assigns(:user)).to eq(user)
    end
  end

end
