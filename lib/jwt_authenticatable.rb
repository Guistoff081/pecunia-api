# frozen_string_literal: true

require 'jwt'
module JwtAuthenticatable
  extend ActiveSupport::Concern
  JWT_SECRET_KEY = Rails.application.credentials.fetch(:jwt_secret_key)

  def jwt_encode(payload, exp = 1.day.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, JWT_SECRET_KEY, 'HS256')
  end

  def jwt_decode(token)
    decoded = JWT.decode(token, JWT_SECRET_KEY, true, { algorithm: 'HS256' })[0]
    ActiveSupport::HashWithIndifferentAccess.new decoded
  end
end
