Rails.application.routes.draw do
  namespace 'api' do    
    resources :contracts

    #GET /api/user?id=
    get '/user/:id', to: 'contracts#getUserContracts'
  end
end
