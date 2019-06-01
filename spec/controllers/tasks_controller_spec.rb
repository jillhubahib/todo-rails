require 'rails_helper'

RSpec.describe TasksController, type: :controller do

  let(:user) { FactoryBot.create(:user) }
  let(:task) { FactoryBot.create(:task, user: user) }

  before(:each) do
    sign_in user
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

end
