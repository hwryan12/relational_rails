Rails.application.routes.draw do
  get '/companies', to: 'companies#index'
  get '/companies/:id', to: 'companies#show'
  get '/vessels', to: 'vessels#index'
  get '/vessels/:id', to: 'vessels#show'
end
