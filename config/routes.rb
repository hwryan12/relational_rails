Rails.application.routes.draw do
  get '/companies', to: 'companies#index'
  get '/companies/:id', to: 'companies#show'
end
