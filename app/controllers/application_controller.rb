class ApplicationController < ActionController::Base

  before_action :set_locale

  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  private

  def set_locale

    if user_signed_in? and current_user.locale.present?
      session[:locale] = current_user.locale
    elsif I18n.available_locales.map(&:to_s).include?(params[:locale])
      session[:locale] = params[:locale]
    end

    I18n.locale = session[:locale] || I18n.default_locale

  end

end
