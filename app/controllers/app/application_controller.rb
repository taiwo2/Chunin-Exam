class App::ApplicationController < ApplicationController
  layout "app"

  before_action :authenticate_user
  after_action :verify_authorized, except: %i[index] # rubocop:disable Rails/LexicallyScopedActionFilter, Lint/RedundantCopDisableDirective

  private

  def authenticate_user
    redirect_to new_session_path unless user_signed_in?
  end
end
