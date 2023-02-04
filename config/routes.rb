Rails.application.routes.draw do
  get '/companies', to: 'companies#index'
  get '/companies/new', to: 'companies#new'
  get '/companies/:id', to: 'companies#show'
  post '/companies', to: 'companies#create'
  get '/companies/:id/edit', to: 'companies#edit'

  patch '/companies/:id', to: 'companies#update'

  get '/vessels', to: 'vessels#index'
  get '/vessels/:id', to: 'vessels#show'
  
  get '/companies/:company_id/vessels', to: 'companies_vessels#index'
end
