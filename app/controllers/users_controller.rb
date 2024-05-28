class UsersController < ApplicationController
  def index
    users = User.all.map(&:info)

    render json: { users: users }
  end

  def create
    user = User.new(create_params)

    if user.save
      render json: { user: user.info }
    else
      render json: { errors: user.errors.full_messages }, status: 400
    end
  end

  private

  def create_params
    hash = params.require(:user).permit(:userName, :age)
    hash[:name] = hash.delete(:userName)
    hash
  end
end
