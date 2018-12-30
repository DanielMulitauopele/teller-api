class ApplicationController < ActionController::Base
  before_action :authenticate_user, :set_headers
  attr_reader :current_user

  private
  def authenticate_user
    @current_user = Authorization.call(request.headers).result
    render json: {error: 'Not authorized to make this request'}, status: 401 unless @current_user
  end

  def set_headers
    response.set_header("Accept", "application/json")
    response.set_header("Content-Type", "application/json")
  end

end
