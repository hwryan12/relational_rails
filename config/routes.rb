Rails.application.routes.draw do
  get '/companies', to: 'companies#index'
  get '/companies/new', to: 'companies#new'
  get '/companies/:id', to: 'companies#show'
  post '/companies', to: 'companies#create'
  get '/companies/:id/edit', to: 'companies#edit'
  delete '/companies', to: 'companies#destroy'

  patch '/companies/:id', to: 'companies#update'
  delete '/companies/:id', to: 'companies#destroy'

  get '/vessels', to: 'vessels#index'
  get '/vessels/:id', to: 'vessels#show'
  get '/vessels/:id/edit', to: 'vessels#edit'
  
  patch '/vessels/:id', to: 'vessels#update'
  delete '/vessels/:id', to: 'vessels#destroy'

  get '/companies/:company_id/vessels', to: 'companies_vessels#index'
  get '/companies/:company_id/vessels/new', to: 'companies_vessels#new'
  post '/companies/:company_id/vessels', to: 'companies_vessels#create'
end
