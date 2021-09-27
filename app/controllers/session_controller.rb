class SessionController < ApplicationController

  def create
    @user = User.find_by_username(params[:username])
    if @user&.authenticate(params[:password])
      login_user
      render json: @user, status: :created
    else
      render json: { error: "Incorrect login"}, status: :unauthorized
    end
  end

  def destroy
    session.clear
  end

  private
end
