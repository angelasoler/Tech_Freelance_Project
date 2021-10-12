Rails.application.routes.draw do
  devise_for :freelancers, path: 'freelancers'
  devise_for :owners, path: 'owners'
  root to: 'home#index'
  resources :projects, only: [:show, :new, :create]
end
