class SessionsController < ApplicationController
  before_action :check_not_logged_in, only: %i[new create]
  def new
    # nologic
  end

  def create
    user = User.find_by(email: params[:email])
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      case user.role
      when 'admin'
        redirect_to admin_dashboard_index_path, notice: 'Login successful'
      else
        redirect_to dashboard_index_path, notice: 'Login successful'
      end
    else
      redirect_to login_path, alert: 'Invalid email or password'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private

  def check_not_logged_in
    redirect_to root_path, notice: 'You are already logged in' if session[:user_id]
  end
end
