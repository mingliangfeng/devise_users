require_dependency "devise_users/application_controller"

module DeviseUsers
  class DeviseUsersController < ApplicationController
    def index
      @recent_users = active_users
    end

  private
    def active_users
      devise_resource_class.limit(20).order('current_sign_in_at desc, last_sign_in_at desc')
    end
  end
end
