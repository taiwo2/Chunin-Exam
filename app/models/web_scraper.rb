class WebScraper
  include HTTParty

  def initialize(url)
    @url = url
  end

  def fetch_website_title
    response = HTTParty.get(@url)

    if response.code.to_i == 200
      Nokogiri::HTML::Document.parse(response.body).title
    else
      false
    end
  end
end
