class StaticPagesController < ApplicationController
  before_action :authenticate_user!

  def home
    @short = Short.new
    @short2 = Short.last
  end

  def redirect
    @redirection = Short.find(params[:id].to_i(36)).url
  end
end
