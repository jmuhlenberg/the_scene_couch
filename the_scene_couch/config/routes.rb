Rails.application.routes.draw do

  # users route
  resources :users do
    # Shallow Nesting : generates the collection actions scoped under the parent, so as to get a sense of the hierarchy, but do not nest the member actions.
    resources :posts, shallow: true
    resources :likes, shallow: true
  end

  # posts route
  resources :posts do
    resources :likes, shallow: true
    resources :users, shallow: true
  end

  # set the root index
  root "posts#index"

  resource :session, only: [:new, :create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


end
