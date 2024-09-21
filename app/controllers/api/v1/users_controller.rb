class Api::V1::UsersController < ApplicationController
  before_action :authenticate_api_v1_user!

  def show
    render json: {data: current_api_v1_user }
  end
end
