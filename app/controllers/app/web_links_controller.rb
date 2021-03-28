class App::WebLinksController < App::ApplicationController
  def index
    if current_user.web_links.size.zero?
      render :index
    else
      redirect_to app_web_link_path(current_user.web_links.first)
    end
  end

  def create
    web_link = current_user.web_links.build(web_link_new_params)

    if web_link.save
      web_response = WebScraper.new(params.dig(:web_link, :original_url))
      web_title = web_response.fetch_website_title
      web_link.update(title: web_title) if web_title
      redirect_to app_web_link_path(web_link)
    else
      render json: { errors: web_link.errors }, status: :unprocessable_entity
    end
  end

  def show
    @web_link = WebLink.find(params[:id])
  end

  def update
    web_link = WebLink.find(params[:id])

    if web_link.update(web_link_update_params)
      redirect_to app_web_link_path(web_link)
    else
      render json: { errors: web_link.errros }, status: :unprocessable_entity
    end
  end

  private

  def web_link_new_params
    params.require(:web_link).permit(:original_url)
  end

  def web_link_update_params
    params.require(:web_link).permit(:title)
  end
end
