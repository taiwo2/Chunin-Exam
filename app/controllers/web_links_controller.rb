class WebLinksController < ApplicationController
  def show
    web_link = WebLink.find_by!(uid: params[:id])

    redirect_to web_link.original_url
  end
end
