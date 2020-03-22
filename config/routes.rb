Rails.application.routes.draw do
  devise_for :users
  root to: 'top_pages#index'
  resources :items, only: [:new, :create]
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get<div class="code-title" data-title="Gemfile">_category_grandchildren', defaults: { format: 'json' }
    end

end
