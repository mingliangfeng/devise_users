require 'rails_helper'

module DeviseUsers
  RSpec.describe DeviseUsersController, :type => :controller do

    describe "GET index" do
      it "redirect if no devise user logined" do
        allow(controller).to receive(:new_session_path).and_return('/')
        get :index, { use_route: :engine_name }
        expect(response.status).to eq(302)
      end

      it "redirect if devise user logined but has no permission to manager other users" do
        allow(controller).to receive(:signed_in?).and_return(true)
        get :index, { use_route: :engine_name }
        expect(response.status).to eq(302)
      end

      it "return success if devise user manager logined" do
        allow(controller).to receive(:signed_in?).and_return(true)
        allow(controller).to receive_message_chain(:devise_resource_object, :devise_user_manager?).and_return(true)
        allow(controller).to receive(:query_active_users).and_return [ double("user") ]
        get :index, { use_route: :engine_name }
        expect(response).to be_success
      end
    end

  end
end
