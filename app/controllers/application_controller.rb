class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :set_locale

  def set_locale
    logger.debug "* Accept-Language: #{request.env['HTTP_ACCEPT_LANGUAGE']}"
    I18n.locale = extract_locale_from_accept_language_header
    logger.debug "* Locale set to '#{I18n.locale}'"
  end

  # called by devise to allow more user attributed to be changed
  # during registration and account update
  def configure_permitted_parameters
    user_attributes = %i[name]
    devise_parameter_sanitizer.permit(:sign_up, keys: user_attributes)
    devise_parameter_sanitizer.permit(:account_update, keys: user_attributes)
    devise_parameter_sanitizer.permit(:accept_invitation, keys: user_attributes)
  end

  private

  def extract_locale_from_accept_language_header
    parsed_local = request.env['HTTP_ACCEPT_LANGUAGE']&.scan(/^[a-z]{2}/)&.first
    return parsed_local if I18n.available_locales.include?(parsed_local)
    I18n.default_locale
  end
end
