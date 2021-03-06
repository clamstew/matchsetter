class RegistrationsController < Devise::RegistrationsController
  before_filter :update_sanitized_params, if: :devise_controller?

  def update_sanitized_params
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:name, :email, :password, :password_confirmation, :first_name, :last_name, :skillset, :age, :gender)}
    devise_parameter_sanitizer.for(:account_update) {|u| u.permit(:name, :email, :password, :password_confirmation, :current_password, :first_name, :last_name, :location_id, :skillset, :age, :gender, :profile_pic )}
  end


protected

  def after_update_path_for(resource)
    user_path(resource)
  end
end
