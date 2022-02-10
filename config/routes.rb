Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root 'static_pages#home'
    get 'static_pages/help'
    get 'user/new'
    get '/signup', to: 'clients#new'
    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'
    get '/logout', to: 'sessions#destroy'
    resources :users 
    resources :clients
    resources :employees
  end
end

