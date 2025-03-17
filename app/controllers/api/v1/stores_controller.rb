class Api::V1::StoresController < ApplicationController
  before_action :authenticate_api_v1_user!, only: [:create]
  
  def create
    store = Store.new(store_params)
    if store.save
      # store_name_only_flgが1の場合はstore_nameのみを返却
      if params[:store_name_only_flg] == "1"
        render json: { store_name: store.store_name }, status: :created
      else
        render json: { store: store }, status: :created
      end
    else
      render json: { errors: store.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def store_params
    params.require(:store)
          .permit(:store_name, :address, :telephone_number, :address, :seating_capacity, :area)
          .merge(user_id: current_api_v1_user.id)
  end
end
