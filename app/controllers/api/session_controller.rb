class Api::SessionController < ApplicationController
  respond_to :json
  def create
    user = User.authenticate(params[:email], params[:password])
    if user 
      render json: {status: 'success', user: user}.to_json and return
    end
    render json: {status: 'failure'}.to_json, status: 404 and return
  end
end