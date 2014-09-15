module DeviseUsers
  class ApplicationController < ActionController::Base
    include Devise::Controllers::Helpers
    include Devise::Controllers::SignInOut
    before_action :authenticate_devise_resource, :total_user_number

  private
    def authenticate_devise_resource
      unless signed_in?(devise_resource_name)
        redirect_to new_session_path(devise_resource_name), notice: t('devise_users.authentication_required')
        return
      end

      unless devise_resource_object.respond_to?(:devise_user_manager?) and devise_resource_object.devise_user_manager?
        redirect_to DeviseUsers.unauthorisation_url, notice: t('devise_users.authorisation_required')
        return
      end
    end

    def devise_resource_class
      devise_resource_object.class
    end

    def total_user_number
      @total_user_number = devise_resource_class.count
    end
    helper_method :total_user_number

    def devise_resource_object
      @devise_resource_object = self.send "current_#{devise_resource_name}".to_sym
    end
    helper_method :devise_resource_object

    def devise_resource_name
      DeviseUsers.devise_resource_name.to_sym
    end
    helper_method :devise_resource_name
  end
end
