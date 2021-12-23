class UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      render json: {msg: 'user created successfully', data: user}, status: :ok
    else
      render json: {error: 'Not able to create user', errors: user.errors.full_messages}, status: :not_implemented
    end
  end

  def show
    @users = User.all
    if @users
      render json: {
        msg: 'List of users',
        data: @users
      }
    else
      render json: {
        error: @users.errors.full_messages
      }
    end
  end

  def signin
    user_params
    @user = User.find_by(user_params[:email])
    if @user[:password] == user_params[:password]
      render json: @user, status: :ok
    else
      render json: {"error": "Invalid Credentials"}, status: :not_found
    end
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
