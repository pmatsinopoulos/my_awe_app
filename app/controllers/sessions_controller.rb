class SessionsController < ApplicationController
  skip_before_action :authenticate_user

  def new
    @session = Session.new
  end

  def create
    @session = Session.new session_params
    if @session.save
      sign_in_user @session.user
      redirect_to dashboard_path, notice: "#{@session.user.name}, welcome back!"
    else
      flash.now[:error] = "Please, try again!"
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to root_url, notice: "You have successfully signed out!"
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
