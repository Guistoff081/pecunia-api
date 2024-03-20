require 'jwt_authenticatable'
class AuthorizeRequest
  include ActiveModel::Model
  include JwtAuthenticatable

  def initialize(headers = {})
    @headers = headers
  end

  def call
    user
  end

  private

  attr_reader :headers

  def user
    @user ||= User.find_by(id: decoded_auth_token[:user_id]) if decoded_auth_token

    return nil if errors.present?

    @user || (errors.add(:base, :failure) && nil)
  end

  def decoded_auth_token
    @decoded_auth_token ||= jwt_decode(http_auth_header)
  rescue JWT::ExpiredSignature
    errors.add(:base, :expired)
    nil
  rescue JWT::DecodeError
    errors.add(:base, :invalid)
    nil
  end

  def http_auth_header
    headers['Authorization'].present? ? headers['Authorization'].split.last : nil
  end
 end
