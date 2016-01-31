class ApplicationController < ActionController::Base
  include Clearance::Controller
  before_action :require_login
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def current_admin?
    current_user.admin?
  end
  def is_admin
    unless current_admin?
      deny_access(I18n.t("flashes.failure_when_not_signed_in"))
    end
  end
end
