module Api
  module V1
    class AuthController < ApplicationController
      def create
        # Find user by email from users table in database
        user = User.find_by(email: params[:email])

        case
        when user.nil?
          render json: { error: { code: 404, message: 'not found' } }, status: 404
        when user.banned?
          render json: { error: { code: 403, message: 'forbidden' } }, status: 403
        when user.authenticate(params[:password])
          render json: { access_token: user.access_token, expires_in: 24.hours, token_type: 'Bearer' }, status: 200
        else
          render json: { error: { code: 401, message: 'forbidden' } }, status: 401
        end
      end
    end
  end
end
