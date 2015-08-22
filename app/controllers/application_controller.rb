class ApplicationController < ActionController::Base

  before_action :set_locale
  before_action :configure_permitted_parameters, if: :devise_controller?

  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) << [:image, :image_cache, :remove_image]
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
