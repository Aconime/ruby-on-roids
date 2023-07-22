class Admin::BaseController < ApplicationController
  before_action :verify_admin

  def verify_admin
    redirect_to root_path unless Current.user && Current.user.role == 'admin'
  end
end
