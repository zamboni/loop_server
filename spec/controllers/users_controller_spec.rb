require 'spec_helper'

describe UsersController do
  context 'creates a user' do
    context 'from email and password' do
      before do
        post :create, user: {email: 'test@example.com', password: 'password'}, format: 'json'
        @response = ActiveSupport::JSON.decode response.body
      end

      it 'returns a user' do
        @response['user'].should be
      end
    end
  end
end
