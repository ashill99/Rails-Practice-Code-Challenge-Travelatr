Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :destinations, only: [:show]
  resources :bloggers, only: [:show, :new, :create]
  resources :posts, only: [:show, :new, :create, :edit, :update]
  post '/add_like/:id', to: 'posts#add_like', as: 'add_like'

end