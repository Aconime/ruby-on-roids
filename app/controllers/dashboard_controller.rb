class DashboardController < ApplicationController
  before_action :validate_user

  def index
    # empty
  end

  def edit
    @user = Current.user
  end

  def update
    if Current.user.update(user_params)
      redirect_to dashboard_index_path, notice: 'User was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def validate_user
    redirect_to root_path if Current.user.blank?
  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name,
      :image_url, :bio, :technologies, :password, :password_confirmation)
  end
end
