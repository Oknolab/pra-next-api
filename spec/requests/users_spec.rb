require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /index" do
    before do
      create_list(:user, 3)
      get "/users"
    end

    it "returns 200" do
      expect(response).to have_http_status(200)
    end

    it "returns users" do
      users_responsed = JSON.parse(response.body)["users"].map(&:symbolize_keys)
      expect(users_responsed).to eq User.all.map(&:info)
    end
  end
end
