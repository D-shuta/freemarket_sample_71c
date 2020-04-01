Rails.application.routes.draw do
  devise_for :users
  resources :signup do
    collection do
      get 'step1'
      get 'step2' # step1とstep2を同時に保存
    end
  end
  # resources :items, only: [:new, :create]

  root to: 'items#index'
  
  resources :items do
    collection do
      get  'get_category_children', defaults: { format: 'json' }
      get  'get_category_grandchildren', defaults: { format: 'json' }
    end

  end
  resources :cards, only: [:new, :show,] do
    collection do
      # card=cardsに修正
      post 'show', to: 'cards#show'
      post 'pay', to: 'cards#pay'
      delete 'delete', to: 'cards#delete'
    end
  end
  resources :user_addresses, only: [:new, :create, :edit, :update]
  resources :users, only: [:index,:new,:show,:edit]

  resources :purchase, only: [:show] do
    member do
      post 'pay', to: 'purchase#pay'
      get 'done', to: 'purchase#done'
    end
  end

end
