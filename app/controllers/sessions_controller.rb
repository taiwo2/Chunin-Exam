class SessionsController < ApplicationController
  layout "slate"

  def new; end

  def create
    auth = Authentication.new(params)

    if auth.authenticated?
      sign_in(auth.user)
      redirect_to app_web_links_path
    else
      render json: { errors: { invalid: ["credentials"] } }, status: :unprocessable_entity
    end
  end

  def destroy
    sign_out_user
    redirect_to new_session_path
  end
end
