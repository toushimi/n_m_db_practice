require 'rails_helper'

RSpec.describe GroupsController, type: :controller do

  describe "GET #new" do
    it "returns http success if logged in" do
      user = create(:user)
      session[:user_id] = user.id
      get :new
      expect(response).to have_http_status(:success)
    end

    it 'returns http #302 to log_in page if not logged in' do
      get :new
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(login_path)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      group = create(:group)
      get :show,params: {id: group.id}
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "returns http success" do
      user = create(:user)
      session[:user_id] = user.id
      group = build(:group)
      post :create, params: {
        group: {
          name: group.name,
          description: group.description
        }
      }
      expect(response).to have_http_status 302
      expect(Group.count).to eq 1
      posted_group = Group.find_by_name group.name
      expect(response).to redirect_to group_path(posted_group)
    end
  end

end
