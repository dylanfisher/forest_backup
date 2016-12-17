Rails.application.routes.draw do
  resources :pages

  root to: 'admin#index'
end
