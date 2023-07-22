class GdprController < ApplicationController
  def destroy
    Current.user.destroy

    redirect_to root_path, notice: 'Your account has been deleted.'
  end
end
