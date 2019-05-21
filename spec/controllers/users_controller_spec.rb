require 'rails_helper'
require 'spec_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #new" do
    before { get :new }
    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "render by view(new)" do
      expect(response).to render_template :new
    end
  end

  describe "POST #create" do
    it 'creates user' do
      userinfo = build(:user)
      expect {
        post :create, params: {
          user: {
            nickname: userinfo.nickname,
            email: userinfo.email,
            password: userinfo.password,
            password_confirmation: userinfo.password
          }
        }
      }.to change{ User.count }
      ActionMailer::Base.deliveries.shift
    end

    it 'send confirmation mail to created user' do
      userinfo = build(:user)
      post :create, params: {
        user: {
          nickname: userinfo.nickname,
          email: userinfo.email,
          password: userinfo.password,
          password_confirmation: userinfo.password
        }
      }
      expect(ActionMailer::Base.deliveries.size).to eq 1
      mail = ActionMailer::Base.deliveries.shift
      expect(mail.from.first).to eq UserMailer.default[:from]
      expect(mail.to.first).to   eq userinfo.email
      user = User.find_by_nickname userinfo.nickname
      expect(mail.body).to include confirm_email_user_url(user.confirm_token)
    end

  end
end
