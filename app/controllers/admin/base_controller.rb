class Admin::BaseController < ActionController::Base
  include Pagy::Backend

  # admin helpers
  include Admin::PaginationHelper
  include Admin::CurrentDetailsHelper
  include Admin::AuthenticationHelper

  # global helpers
  include NavbarHelper

  layout 'admin'
end
