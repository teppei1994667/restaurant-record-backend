class Api::V1::Auth::SessionsController < DeviseTokenAuth::SessionsController
  private

  def sign_in_params
    params.require(:session).permit(:email, :password)
  end
end
