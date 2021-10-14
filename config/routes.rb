Rails.application.routes.draw do
  devise_for :freelancers, path: 'freelancers'
  resources :freelancers, only: [:update] do
    get 'complete_profile', on: :collection
  end
  devise_for :owners, path: 'owners'
  root to: 'home#index'
  resources :projects, only: [:show, :new, :create]
end
