class UsersController < ApplicationController
  skip_before_action :authenticate_user

  def new
    @sign_up = SignUp.new
  end

  def create
    @sign_up = SignUp.new sign_up_params
    if @sign_up.save
      flash[:notice] = "Welcome!"
      sign_in_user @sign_up.user
      redirect_to  dashboard_path
    else
      flash.now[:error] = "Please, try again!"
      render :new
    end
  end

  private

  def sign_up_params
    params.require(:sign_up).permit(:email, :password, :password_confirmation, :name)
  end
end