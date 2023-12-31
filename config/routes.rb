Rails.application.routes.draw do
  resources :articles
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

        root 'pages#home'

        get 'about', to: 'pages#about'

        resources :articles

        get 'signup', to: 'users#new'
        resources :users, except:[:new]


        # User login
        get 'login', to: 'sessions#new'
        post 'login', to: 'sessions#create'
        delete 'logout', to: 'sessions#destroy'
end
