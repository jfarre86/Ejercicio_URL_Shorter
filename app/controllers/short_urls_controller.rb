class ShortUrlsController < ApplicationController
  def new
      @short_urls = Short_url.new
  end
end
