Rails.application.routes.draw do
  resources :menus
  resources :pages

  root to: 'admin#index'
end
