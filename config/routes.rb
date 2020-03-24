Rails.application.routes.draw do
  devise_for :users
  resources :signup do
    collection do
      get 'step1'
      get 'step2' # step1とstep2を同時に保存
    end
  end
  root to: 'top_pages#index'
  resources :items, only: [:new, :create]
  resources :categories, only: [:new, :create]
  resources :brands, only: [:index]
  resources :cards, only: [:new, :destroy, :edit, :update]
  resources :user_addresses, only: [:new, :create, :edit, :update]
end
