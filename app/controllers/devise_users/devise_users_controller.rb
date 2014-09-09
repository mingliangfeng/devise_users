require_dependency "devise_users/application_controller"

module DeviseUsers
  class DeviseUsersController < ApplicationController

    def index

    end

    def active_users
      @recent_users = query_active_users
    end

  private
    def query_active_users
      devise_resource_class.limit(20).order('current_sign_in_at desc, last_sign_in_at desc')
    end

  end
end
