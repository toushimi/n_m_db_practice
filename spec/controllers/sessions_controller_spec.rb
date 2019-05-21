require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it 'redirect to mypage when logged in' do
      user = create(:user)
      session[:user_id] = user
      get :new
      expect(response).to redirect_to mypage_path
    end

  end

end
