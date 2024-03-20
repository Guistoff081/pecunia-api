module Api
  module V1
    class SessionsController < ApplicationController
      skip_before_action :authenticate_request

      def create
        auth_service = AuthenticateUser.new(session_params[:email], session_params[:password])
        user_data = auth_service.call

        if user_data.nil?
          render json: { errors: auth_service.errors.full_messages }, status: :unauthorized
        else
          render 'api/v1/sessions/create', formats: [:json],
            locals: user_data, status: :ok
        end
      end

      def destroy

      end

      private

      def session_params
        params.require(:user).permit(:email, :password)
      end
    end
  end
end
