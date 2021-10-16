Rails.application.routes.draw do
  devise_for :freelancers, path: 'freelancers'
  devise_for :owners, path: 'owners'
  root to: 'home#index'
  resources :profile, only: [:new, :create] do
    get 'my_profile', on: :collection
  end
  resources :projects, only: [:show, :new, :create] do
    get 'my_projects', on: :collection
  end
end
