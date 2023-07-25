class RegistrationsController < ApplicationController
  before_action :check_not_logged_in, only: %i(new create)

  def index; end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.role = 'user'

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'Registration successful'
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name,
      :password, :password_confirmation)
  end

  def check_not_logged_in
    redirect_to root_path, notice: 'You are already logged in' if session[:user_id]
  end
end
