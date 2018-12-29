class AuthenticationsController < ApplicationController
  skip_before_action :authenticate_user, :verify_authenticity_token

  def create
    authenticate
  end

  private

  def authenticate
    check_for_auth = Authentication.call(params[:email], params[:password])

    if check_for_auth.success?
      render json: {teller_api_token: check_for_auth.result}
    else
      render json: {error: check_for_auth.errors}, status: :unauthorized
    end
  end
end
