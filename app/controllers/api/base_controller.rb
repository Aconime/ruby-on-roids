class Api::BaseController < ApplicationController
  before_action :validate_request

  def validate_request
    head :unauthorized unless params[:password] == '123'
  end
end
