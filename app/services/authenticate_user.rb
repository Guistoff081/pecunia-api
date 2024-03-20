require 'jwt_authenticatable'
class AuthenticateUser
  include ActiveModel::Model
  include JwtAuthenticatable

  attr_accessor :email, :password

  def initialize(email, password)
    @email = email
    @password = password
  end

  def call
    user = find_user
    return failure_message unless user

    authenticate_user(user)
  end

  private

  def find_user
    User.find_by(email: email)
  end

  def authenticate_user(user)
    return failure_message unless user.authenticate(password)

    {token: jwt_encode(user_id: user.id), user:}
  end

  def failure_message
    errors.add(:base, :failure)
    nil
  end
end
