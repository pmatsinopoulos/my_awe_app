class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user

  helper_method :current_user

  private

  # @param user {User}
  #
  def sign_in_user(user)
    reset_session
    session[:user_id] = user.id
  end

  def authenticate_user
    if current_user.nil?
      flash[:error] = "You need to sign in"
      redirect_to login_url
    end
  end

  def current_user
    User.find_by_id session[:user_id]
  end
end
