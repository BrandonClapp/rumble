class RegistrationsController < Devise::RegistrationsController

  # before_filter :configure_permitted_parameters, if: :devise_controller?

  private

  def sign_up_params
    params.require(:user).permit(:name, :last_name, :email, :password, :password_confirmation, :current_password)
  end

  def account_update_params
    params.require(:user).permit(:name, :last_name, :email, :password, :password_confirmation, :current_password)
  end

  # def update_resource(resource, params)
  #   params.delete(:current_password)
  #   resource.update_without_password(params)
  # end

  # def configure_permitted_parameters

  #   registration_params = [:name, :email, :password, :password_confirmation]

  #   if params[:action] == 'update'
  #     devise_parameter_sanitizer.for(:account_update) { 
  #       |u| u.permit(registration_params << :current_password)
  #     }
  #   elsif params[:action] == 'create'
  #     devise_parameter_sanitizer.for(:sign_up) { 
  #       |u| u.permit(registration_params) 
  #     }
  #   end
  # end
end