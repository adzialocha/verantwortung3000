class AdminController < ApplicationController

  layout 'admin'

  before_filter :require_admin

  private

  def require_admin

    unless current_user.try(:admin?)
      redirect_to new_user_session_path, :alert => t("common.alert_no_permission")
    end

  end

end
