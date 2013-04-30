class ApplicationController < ActionController::Base
  protect_from_forgery
  check_authorization unless: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    if current_user.nil?
      redirect_to new_user_session_path, alert: I18n.t("flash.access_permit")
    else
      redirect_to root_url, alert: I18n.t("flash.access_denied")
    end
  end
end
