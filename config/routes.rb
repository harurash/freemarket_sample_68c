Rails.application.routes.draw do
  devise_for :users,:controllers => {
    omniauth_callbacks: 'users/omniauth_callbacks',
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
    :passwords => 'users/passwords'
  }
  get 'images/create'
  root "items#index"
  get 'card/new'
  get 'card/show'
  resources :users, only:[:show]
  resources :categories, only: [:index, :show, :new, :edit, :destroy]
  resources :adresses
  resources :items do
    collection do
      get 'get_size_children', defaults: { format: 'json' }
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
      get 'search'
    end
    resources :images, only: :create
    patch  :buy,      on: :member
    get  :comfirm,      on: :member
    get  :transaction,      on: :member
    resource :likes, only:[:create,:destroy,:show]
  end
  
  resources :adresses
  resources :card, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end
end