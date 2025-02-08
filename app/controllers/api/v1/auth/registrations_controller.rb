class Api::V1::Auth::RegistrationsController < DeviseTokenAuth::RegistrationsController
  before_action :authenticate_api_v1_user!, only: [:update, :destroy]
  # DeviseTokenAuth::RegistrationsControllerで定義されたcreateメソッド実行後にset_token_infoメソッドを実行
  after_action :set_token_info, only: [:create]

  def update
    if current_api_v1_user.update(user_info_update_params)
      render json: {user_model: current_api_v1_user}
    else
      render json: { errors: current_api_v1_user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    if current_api_v1_user.destroy
      render json: { message: "アカウントを削除しました" }
    else
      render json: { errors: current_api_v1_user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  # 新規登録時のパラメータを設定
  def sign_up_params
    params.require(:registration).permit(:name, :email, :password, :password_confirmation)
  end

  # ユーザー情報更新時のパラメータを設定
  def user_info_update_params
    params.require(:registration).permit(:name, :email)
  end

  # ユーザーデータが保存されているか確認し、保存されていれば新しいトークンを作成。
  # ヘッダーに access-token と client を設定
  def set_token_info
    return unless @resource.persisted?

    token = @resource.create_new_auth_token
    response.set_header("access-token", token["access-token"])
    response.set_header("client", token["client"])
  end
end
