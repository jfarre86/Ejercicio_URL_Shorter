class ShortUrlsController < ApplicationController
  def new
      @short_url = ShortUrl.new(short_url_params)
  end

  def create
      @short_url = ShortUrl.new(short_url_params)
  		if @short_url.save #esta linea ejecuta un obj.save q devuelve un booleano, si es true...
  			redirect_to "short_url#index" # nos redirija a ese short_url
  		else # si es false...
  			render :new # q nos redirija al "/short_url/new"
  		end
  end

  def index
    @short_url = ShortUrl.all
  end

  def show
    @short_url = ShortUrl.find(params[:id])
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
