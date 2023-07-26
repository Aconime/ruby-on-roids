module Admin::CurrentDetailsHelper
  extend ActiveSupport::Concern

  included do
    before_action :set_current_user

    private

    def set_current_user
      return unless session[:user_id]

      Current.user = User.find_by(id: session[:user_id])
    end
  end
end
