# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  before_action :authenticate_user!, only: [:destroy]
  respond_to :json

  # POST /resource/sign_in
  def create
    user = User.find_by(email: params[:email])
    if user&.valid_password?(params[:password])
      self.resource = user
      set_flash_message!(:notice, :signed_in)
      sign_in(resource_name, resource)
      yield resource if block_given?
      respond_with resource, location: after_sign_in_path_for(resource)
    else
      render json: {
        status: 401,
        message: "Invalid credentials"
      }, status: :unauthorized
    end
  end

  def destroy
    if current_user
      render json: {
        status: 200,
        message: 'logged out successfully'
      }, status: :ok
    else
      render json: {
        status: 401,
        message: "Couldn't find an active session."
      }, status: :unauthorized
    end
  end

  private

    def respond_with(resource, _opts = {})
      render json: {
        status: { code: 200, message: 'Logged in sucessfully.' },
        data: resource
      }, status: :ok
    end
end
