Rails.application.routes.draw do
  # Concerns
  concern :paginatable do
    get '(page/:page)', action: :index, on: :collection
  end

  # Root
  root to: 'public#index'

  # Admin
  get 'admin', to: 'admin#index'

  # Admin Resources
  scope :admin do
    resources :media_items do
      collection do
        post 'update_multiple'
      end
    end
    resources :menus, concerns: :paginatable
    resources :pages, concerns: :paginatable
    resources :settings
    resources :users
  end

  # Devise
  devise_for :users

  devise_scope :user do
    get 'admin', to: 'devise/sessions#new'
  end

  get ':id', to: 'pages#show'
end
