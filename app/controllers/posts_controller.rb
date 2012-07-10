class PostsController < ApplicationController
  def index
  end

  def badges
    logger.debug(params.inspect)
    conn = Faraday.new(:url => 'http://api.stackoverflow.com') do |c|
      c.use Faraday::Request::UrlEncoded  # encode request params as "www-form-urlencoded"
      c.use Faraday::Response::Logger     # log request & response to STDOUT
      c.use Faraday::Adapter::NetHttp     # perform requests with Net::HTTP
    end

    response = conn.get '/1.1/badges'
    
    @badges = JSON.parse(response.body)["badges"].slice(0, 5)

    respond_to do |format|
      format.html
      format.json
      format.js
    end
  end
end
