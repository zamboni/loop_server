require 'spec_helper'

describe Api::SessionController do
  context 'login' do
    before do
      @user = FactoryGirl.create :user
      post :create, email: 'test@example.com', password: 'password', format: 'json'
      @response = ActiveSupport::JSON.decode response.body
    end

    it 'returns a user' do
      @response['user'].should be
    end
  end
end
