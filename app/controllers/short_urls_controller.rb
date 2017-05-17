class ShortUrlsController < ApplicationController
  def new
      @short_urls = ShortUrl.new(short_url_params)
  end

  def create
      @short_urls = ShortUrl.new(short_url_params)
  end

  private

	def short_url_params
		params.require(:short_url).permit(:url)

    # hacemos q el campo url
		# sea permitido pero implicitamente estamos HACIENDO INACCESIBLES
		# desde nuestra aplicacion Web LOS OTROS campos como url_id PARA EVITAR
		# ATAQUES DE USUARIOS MALICIOSOS
	end
end
