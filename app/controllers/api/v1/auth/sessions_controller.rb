class Api::V1::Auth::SessionsController < DeviseTokenAuth::SessionsController
  # パラメータがコントローラー名でラップされるのを制御
  wrap_parameters false

end
