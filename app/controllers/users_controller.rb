class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    if @user.save
      login_user
      render json: @user, status: :ok
    else
      render json: { error: @user.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def show
    if logged_in
      @user = User.find_by_id(session[:user_id])
      render json: @user
    else
      render json: { error: "no user found"}, status: :unauthorized
    end
  end

  private
    def user_params
      params.permit(:username, :password, :password_confirmation)
    end
end
