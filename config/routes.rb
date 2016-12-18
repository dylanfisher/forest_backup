Rails.application.routes.draw do
  concern :paginatable do
    get '(page/:page)', action: :index, on: :collection
  end

  resources :menus, concerns: :paginatable
  resources :pages, concerns: :paginatable

  root to: 'admin#index'
end
