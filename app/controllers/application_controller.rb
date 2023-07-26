class ApplicationController < ActionController::Base
  include Pagy::Backend
  include Shared::CurrentDetailsHelper
end
