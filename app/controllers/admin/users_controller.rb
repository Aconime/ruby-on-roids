class Admin::UsersController < Admin::BaseController
  def index
    @users = User.all
    @pagy, @users = pagy(@users)
  end
end
