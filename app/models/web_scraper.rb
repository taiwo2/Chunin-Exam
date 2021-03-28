class WebScraper
  include HTTParty

  def initialize(url)
    @url = url
  end

  def web_title
    response = HTTParty.get(url)
    response.body
  end
end
