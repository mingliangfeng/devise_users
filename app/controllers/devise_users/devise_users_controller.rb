require_dependency "devise_users/application_controller"

module DeviseUsers
  class DeviseUsersController < ApplicationController

    def index
      @menu_item = :user_list
      @users_count = total_user_number
      @users = all_users
    end

    def search
      search_query = devise_resource_class.where("email LIKE ?", "%#{params[:q]}%")
      @users_count = search_query.count
      @users = search_query.order('created_at desc').page(params[:page]).per 1
      @searching = true
      render :index
    end

    def active_users
      @menu_item = :active_users
      @recent_users = query_active_users
    end

  private
    def query_active_users
      devise_resource_class.limit(20).order('current_sign_in_at desc, last_sign_in_at desc')
    end

    def all_users
      devise_resource_class.order('created_at desc').page params[:page]
    end

  end
end
