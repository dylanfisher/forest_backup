Rails.application.routes.draw do
  # Concerns
  concern :paginatable do
    get '(page/:page)', action: :index, on: :collection
  end

  # Admin
  get 'admin', to: 'admin#index'

  # Admin Resources
  scope :admin do
    get 'settings/:id', to: 'settings#edit', as: 'setting'
    patch 'settings/:id', to: 'settings#edit'
    resources :menus, concerns: :paginatable
    resources :pages, concerns: :paginatable
  end


  # Root
  # TODO: temporary root path
  root to: 'admin#index'
end
