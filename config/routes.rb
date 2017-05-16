Rails.application.routes.draw do
  get 'short_urls/new'

  #root :to => "url"
  get "/short_urls/new", to: "short_urls#new"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
#añado esta linea como prueba del new Branch
