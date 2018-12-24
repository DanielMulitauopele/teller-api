class Authentication
  prepend SimpleCommand # similar to include, but looks at module methods before class methods
  # UserAuthentication.ancestors #=> [SimpleCommand, UserAuthentication, Object]

  def initialize(email, password)
    @email = email
    @password = password
  end

  def call
    JsonWebToken.encrypt(user_id: user.id) if user
  end

  private

  attr_reader :email, :password

  # See if user exists in our database based on email
  def user
    user = User.find_by_email(email)
    # return the user if a user with that email is found and the password is valid
    return user if user && user.authenticate(password)
    #.authenticate is an ActiveModel::SecurePassword method
    #.authenticate is included via ActiveRecord inheritance and using has_secure_password in the User model
    #.authenticate returns self if password is correct, otherwise returns false

    # Otherwise, add this message to error messages & return nothing
    errors.add(:user_authentication, 'This email and password combination is invalid.')
    nil
  end
end
