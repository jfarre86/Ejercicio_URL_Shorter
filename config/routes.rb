Rails.application.routes.draw do

#   recuerda, una ruta es:
# =>   VERBO “PATH”, to: “CONTROLADOR#ACCION”
  get "/short_urls/new", to: "short_urls#new"
  get "/short_urls/index", to: "short_urls#index"
  get "/short_urls/:id", to: "short_urls#show"
  get "/short_urls/admin", to: "short_urls#admin"
  #get "/admin", to: "short_urls#admin"
  #delete "/short_urls/:id", to: "short_urls#destroy"
#  resources :short_url, only[:new, :index, :create] #esto es para poder llamar los verbos [:new, :index, :create] del recurso short_url


  post "short_urls", to: "short_urls#create", as: "short_urls"
# VERBO “PATH”, to: “CONTROLADOR#ACCION”
# verbo: es un formulario y queremos crear algo en base de datos. Dime qué verbo usarías?
# path: te lo digo, por convención es es recurso en plural: “short_urls”
# controlador: qué controlador debe encargarse de gestionar esta request?
# acción: por convención, cuando damos de alta a través de un formulario, la acción es: create

end
#añado esta linea como prueba del new Branch
