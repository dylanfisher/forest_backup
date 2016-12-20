Rails.application.routes.draw do
  resources :media_items
  # Concerns
  concern :paginatable do
    get '(page/:page)', action: :index, on: :collection
  end

  # Admin
  get 'admin', to: 'admin#index'

  # Admin Resources
  scope :admin do
    resources :settings
    resources :menus, concerns: :paginatable
    resources :pages, concerns: :paginatable
  end

  # Root
  root to: 'public#index'
end
