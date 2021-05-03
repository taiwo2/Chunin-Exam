class StaticPagesController < ApplicationController
  def home
    @short = Short.new
    @short2 = Short.last
  end

  def redirect
    @redirection = Short.find(params[:id].to_i(36)).url
  end
end
