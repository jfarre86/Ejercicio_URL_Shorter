class ShortUrlsController < ApplicationController
  def new
      @short_url = ShortUrl.new()
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
    @url = ''
    formato_http(@short_url.url)
    incrementar_visitas(@short_url)

    headers["Status"] = 'ShortUrl - Redireccionando...'
    redirect_to @url
  end


  def admin
    @short_url = ShortUrl.all
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

def formato_http(url_original)
  #esta funcion determina si la url empieza por http// y no pues se lo concatena y devuelve el resultado
  @url = ''
  if url_original[1..7] != 'http://' && url_original[1..8] != 'https://'
    if url_original[1..7] != 'http://'
      @url = 'http://'
    else
      @url = 'https://'
    end
  end
  return @url + url_original
end

def incrementar_visitas(short_url)
    short_url.visits_counter = short_url.visits_counter + 1
    short_url.save
end
