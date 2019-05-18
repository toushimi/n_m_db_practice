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
end
