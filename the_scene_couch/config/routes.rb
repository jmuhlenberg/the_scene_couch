Rails.application.routes.draw do

  resources :users do
    # Shallow Nesting : generates the collection actions scoped under the parent, so as to get a sense of the hierarchy, but do not nest the member actions.
    resources :posts, shallow: true
    resources :likes, shallow: true
  end

  # these are now redundant
  # resources :posts
  # resources :likes

  resource :session, only: [:new, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
