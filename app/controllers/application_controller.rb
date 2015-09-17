class ApplicationController < ActionController::Base

  include PublicActivity::StoreController

  before_action :set_locale
  before_action :configure_permitted_parameters, if: :devise_controller?

  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  protected

  def configure_permitted_parameters

    additional_params = [:first_name, :last_name, :tel, :street, :city_code, :city, :country]

    devise_parameter_sanitizer.for(:account_update) << [:image, :image_cache, :remove_image, :imageable_id, :imageable_type, :description] + additional_params

    devise_parameter_sanitizer.for(:sign_up) << additional_params

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
