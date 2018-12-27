class JsonWebToken
  class << self # This line open's up self's singleton class, which will contain the singleton/class methods below. Each will belong to one object, the instance of the Class class
    # creates a unique token to authenticate the user based on user ID, the unique base key of our Rails app, & expiration
    def encrypt(payload, exp = 24.hours.from_now)
      payload[:exp] = exp.to_i
      JWT.encode(payload, Rails.application.credentials.teller_secret_key_base)
    end

    # uses our app's secret key to decode the token & check validity of each request
    def decrypt(token)
      body = JWT.decode(token, Rails.application.credentials.teller_secret_key_base)[0]
      HashWithIndifferentAccess.new(body) # HashWithIndifferentAccess gives access to hash as a symbol or string
    rescue # throws an exception
      nil
    end
  end
end