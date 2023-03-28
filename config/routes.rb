Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # film : pas de routes
  # list : toutes
  # bookmarks : toutes, nested

  resources :lists, except: %i[new edit update] do
    resources :bookmarks, only: %i[create]
  end

  resources :bookmarks, only: %i[update destroy]

end
