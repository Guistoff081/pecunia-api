class ApplicationController < ActionController::API

  before_action :authenticate_request
  attr_reader :current_user

  private

  def authenticate_request
    authorization_service = AuthorizeRequest.new(request.headers)
    @current_user = authorization_service.call
    render json: { errors: authorization_service.errors.full_messages }, status: :unauthorized unless @current_user
  end
end
