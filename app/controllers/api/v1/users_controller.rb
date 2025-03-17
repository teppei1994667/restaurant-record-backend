class Api::V1::UsersController < ApplicationController
  before_action :authenticate_api_v1_user!, only: [:show]

  def authenticated
    if current_api_v1_user
      render json: {is_login: true}
    else
      render json: {is_login: false}
    end
    

  end

  def show
    store = Store.includes(:user)
    @stores = store.where(user_id: current_api_v1_user.id)
    store_names = []
    @stores.each do |store|
      store_names.push(store.store_name)
    end
    render json: {user: current_api_v1_user, store_names: store_names }
  end
end
