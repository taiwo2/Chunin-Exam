class App::WebLinksController < App::ApplicationController
  def index; end

  def create
    web_link = current_user.web_links.build(web_link_params)

    if web_link.save
      web_response = WebScraper.new(params.dig(:web_link, :original_url))
      web_title = web_response.fetch_website_title
      web_link.update(title: web_title) if web_title
    else
      render json: { errors: web_link.errors }, status: :unprocessable_entity
    end
  end

  def show
    @web_link = WebLink.find(params[:id])
  end

  private

  def web_link_params
    params.require(:web_link).permit(:original_url)
  end
end
