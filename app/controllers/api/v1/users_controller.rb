class Api::V1::UsersController < ApplicationController
  before_action :authenticate_api_v1_user!, only: [:show]

  def authenticated
    if current_api_v1_user
      render json: {is_login: true}
      return
    end
    render json: {is_login: false}

  end

  def show
    render json: {user: current_api_v1_user }
  end
end
