Rails.application.routes.draw do
  root "items#index"
  get 'card/new'
  get 'card/show'
  get 'categories/index'
  devise_for :users
  resources :users, only: :show
  resources :adresses
  resources :items do
    patch  :buy,      on: :member
    get  :comfirm,      on: :member
    resources :likes, only:[:create,:destroy]
  end
  resources :categories, only: [:index, :show, :new, :edit, :destroy] do
    #Ajaxで動くアクションのルートを作成
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
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
end