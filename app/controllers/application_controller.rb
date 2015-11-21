class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from ActionController::RedirectBackError, with: :root

  def root
    redirect_to :root
  end

  def after_sign_in_path_for(_resource)
    home_index_path
  end

  # def after_sign_out_path_for(resource)
  #  admin_root_path
  # end

end
