class Admin::BaseController < ApplicationController
  before_action :verify_admin

  def verify_admin
    # TODO: complete logic
  end
end
