class Api::V1::Auth::SessionsController < DeviseTokenAuth::SessionsController
  wrap_parameters false

end
