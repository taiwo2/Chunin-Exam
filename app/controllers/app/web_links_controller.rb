class App::WebLinksController < App::ApplicationController
  def index
    if current_user.web_links_count.zero?
      render :index
    else
      redirect_to app_web_link_path(current_user.web_links.first)
    end
  end

  def create
    skip_authorization
    web_link = current_user.web_links.build(web_link_new_params)

    if web_link.invalid?
      web_link.errors.add("original_url", "is invalid")
      return render json: { errors: web_link.errors }, status: :unprocessable_entity
    end

    web_title = WebScraper.new(params.dig(:web_link, :original_url)).fetch_website_title
    unless web_title
      web_link.errors.add("original_url", "is invalid")
      return render json: { errors: web_link.errors }, status: :unprocessable_entity
    end

    web_link.save
    web_link.update(title: web_title)
    redirect_to app_web_link_path(web_link)
  end

  def show
    @web_link = WebLink.find(params[:id])
    authorize @web_link
  end

  def update
    web_link = WebLink.find(params[:id])
    authorize web_link

    if web_link.update(web_link_update_params)
      redirect_to app_web_link_path(web_link)
    else
      render json: { errors: web_link.errros }, status: :unprocessable_entity
    end
  end

  def destroy
    web_link = WebLink.find(params[:id])
    authorize web_link

    web_link.destroy
    redirect_to app_web_links_path
  end

  private

  def web_link_new_params
    params.require(:web_link).permit(:original_url)
  end

  def web_link_update_params
    params.require(:web_link).permit(:title)
  end
end
