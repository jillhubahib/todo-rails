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

  describe "POST #create" do
    it "creates a task and redirect back to root path" do
      task = FactoryBot.build(:task)

      expect(post :create, params: { task: { name: task.name } }).to redirect_to root_path
      expect(Task.find_by(name: task.name)).not_to be_nil
    end
  end

  describe "PUT #update" do
    it "toggles task to complete" do
      put :update, params: { id: task.id, task: { completed_at: task.completed_at } }

      expect(response).to have_http_status(:success)
      expect(task.reload.completed_at).to be_nil

      put :update, params: { id: task.id, task: { completed_at: nil } }

      expect(response).to have_http_status(:success)
      expect(task.reload.completed_at).not_to be_nil
    end
  end

end
