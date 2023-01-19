class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :memory_name])
  end

  def after_sign_out_path_for(resource)
    if resource == :memory
      user_root_path
    elsif resource == :user
      root_path
    end
  end

end
