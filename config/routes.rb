Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # film : pas de routes
  # list : toutes
  # bookmarks : toutes, nested

  resources :lists, except: :new do
    resources :bookmarks, only: %i[new create destroy]
  end

end
