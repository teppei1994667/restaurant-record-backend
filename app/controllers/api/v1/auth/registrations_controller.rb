class Api::V1::Auth::RegistrationsController < DeviseTokenAuth::RegistrationsController
  before_action :authenticate_api_v1_user!, only: [:update, :destroy]
  # DeviseTokenAuth::RegistrationsControllerで定義されたcreateメソッド実行後にset_token_infoメソッドを実行
  after_action :set_token_info, only: [:create]
  # パラメータがコントローラー名でラップされるのを制御(自動的にregistrationというキーが追加されるのを防ぐ)
  wrap_parameters false

  def update
    if password_update_request?
      # 現在のパスワードが正しいか確認
      unless current_api_v1_user.valid_password?(params[:current_password])
        return render json: { errors: ["現在のパスワードが間違っています"] }, status: :unprocessable_entity
      end
      # パスワード変更
      if current_api_v1_user.update(password_update_params)
        render json: { message: "パスワードを変更しました" }, status: :ok
      else
        render json: { errors: current_api_v1_user.errors.full_messages }, status: :unprocessable_entity
      end
    else
      # ユーザー情報の更新
      if current_api_v1_user.update(user_info_update_params)
        render json: {user_model: current_api_v1_user}
      else
        render json: { errors: current_api_v1_user.errors.full_messages }, status: :unprocessable_entity
      end
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
    params.permit(:name, :email, :password, :password_confirmation)
  end

  # パスワード変更のリクエストかを判定
  def password_update_request?
    params[:password].present? || params[:password_confirmation].present?
  end
    
  # ユーザー情報更新時のパラメータを設定
  def user_info_update_params
    params.permit(:name, :email)
  end

  # パスワード変更時のパラメータを設定
  def password_update_params
    params.permit(:password, :password_confirmation)
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
