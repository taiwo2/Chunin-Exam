class WebLinksController < ApplicationController
  def show
    web_link = WebLink.find_by!(uid: params[:id])
    ahoy.track("Link click", title: web_link.uid)

    redirect_to web_link.original_url
  end
end
