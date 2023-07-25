module Admin::AuthenticationHelper
  extend ActiveSupport::Concern

  included do
    before_action :validate_admin

    private

    def validate_admin
      redirect_to root_path unless Current.user && Current.user.role == 'admin'
    end
  end
end
