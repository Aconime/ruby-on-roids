class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      case user.role
      when 'user'
        redirect_to dashboard_index_path, notice: 'Login successful'
      when 'admin'
        redirect_to admin_users_path, notice: 'Login successful'
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
end
