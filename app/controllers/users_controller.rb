class UsersController < ApplicationController
  skip_before_action :authenticate_user, :verify_authenticity_token

  def create
    User.create(user_params)
    authenticate
  end

  private
  def authenticate
    auth_new_user = Authentication.call(user_params[:email], user_params[:password])

    if auth_new_user.success?
      render json: {teller_api_token: auth_new_user.result}
    else
      render json: {error: auth_new_user.errors}, status: :unauthorized
    end
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
