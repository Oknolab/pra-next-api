class UsersController < ApplicationController
  def index
    users = User.all.map(&:info)

    render json: { users: users }
  end
end
