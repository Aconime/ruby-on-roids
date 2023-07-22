class DashboardController < ApplicationController
  before_action :validate_user

  def index; end

  def validate_user
    redirect_to root_path if Current.user.blank?
  end
end
