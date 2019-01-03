class UsersController < ApplicationController
  skip_before_action :authenticate_user, :verify_authenticity_token

  def create
    user = User.create(user_params)
    if user.save
      authenticate
    else
      render json: {error: "Unfortunately, your account could not be created. Please make sure your password is longer than 10 characters."},
             status: 400
    end
  end

  private

  def authenticate
    auth_new_user = Authentication.call(user_params[:email], user_params[:password])

    if auth_new_user.success?
      render json: {teller_api_token: auth_new_user.result},
             status: 201
    else
      render json: {error: auth_new_user.errors}, status: :unauthorized
    end
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
