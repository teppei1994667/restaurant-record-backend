class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken

  # Token による CSRF 対策を放棄する
  skip_before_action :verify_authenticity_token
  # ヘルパーメソッドの定義
  helper_method :current_api_v1_user, :user_signed_in?
end
