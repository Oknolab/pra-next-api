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

  describe "POST /create" do
    before do
      post "/users", params: { user: { userName: "Alice", age: 20 } }
    end

    it "returns 200" do
      expect(response).to have_http_status(200)
    end

    it "returns user" do
      user_responsed = JSON.parse(response.body)["user"].symbolize_keys
      expect(user_responsed).to eq User.last.info
    end
  end
end
