class ApplicationController < ActionController::API
  include ActionController::Cookies

  def login_user
    session[:user_id] = @user.id
  end

  def logged_in
    !!session[:user_id]
  end


end
