class Authorization
  prepend SimpleCommand # similar to include, but looks at module methods before class methods
  # UserAuthentication.ancestors #=> [SimpleCommand, UserAuthentication, Object]

  def initialize(headers = {})
    @headers = headers
  end

  def call
    user
  end

  private
  attr_reader :headers

  def user
    # returns the user unless a user cannot be found or decoded_auth_token returns false
    @user ||= User.find(decrypted_token[:user_id]) if decrypted_token
    @user || errors.add(:token, 'Your token is not valid.') && nil # either returns the user or throws an error & returns nothing
  end

  # decrypts the token recieved from the authorization header & gets user's ID
  def decrypted_token
    @decrypted_token ||= JsonWebToken.decrypt(received_token)
  end

  # retrieve token from authorization header
  def received_token
    if headers['Authorization'].present?
      return headers['Authorization'].split(' ').last
    else
      errors.add(:token,'Missing token')
    end
    nil
  end
end
