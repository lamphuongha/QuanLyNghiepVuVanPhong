class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private

  def current_user
    @current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
  end
  helper_method :current_user
  
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Bạn không có quyền truy cập trang này."
    redirect_to root_url
  end
end
