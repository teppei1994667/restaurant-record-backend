Rails.application.routes.draw do
  # userの認証
  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for "User", at: "auth", controllers: {
        registrations: "api/v1/auth/registrations",
        sessions: "api/v1/auth/sessions"
      }

      # resource :user, only: [:show]
      get "user/authenticated" => "users#authenticated"
    end
  end


  # クライアントとの接続確認の為作成(削除予定)
  resources :tests

  # アプリケーションの状態監視を行う為(Rails7系からデフォルトで設定されている)
  # ※削除するかは要検討
  get "up" => "rails/health#show", as: :rails_health_check
end
