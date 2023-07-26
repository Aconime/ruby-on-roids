class Admin::BaseController < ActionController::Base
  include Pagy::Backend

  include Shared::CurrentDetailsHelper
  include Shared::NavbarHelper

  include Admin::PaginationHelper
  include Admin::AuthenticationHelper

  layout 'admin'
end
