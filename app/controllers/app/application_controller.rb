class App::ApplicationController < ApplicationController
  before_action :authenticate_user

  private

  def authenticate_user
    redirect_to new_session_path unless user_signed_in?
  end
end
