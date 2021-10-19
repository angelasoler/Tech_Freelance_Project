Rails.application.routes.draw do
  devise_for :freelancers, path: 'freelancers', controllers: { registrations: "registrations" }
  devise_for :owners, path: 'owners'
  root to: 'home#index'
  resources :profiles, only: [:new, :create, :show] do
    get 'my_profile', on: :collection
  end
  resources :projects, only: [:show, :new, :create] do
    get 'my_projects', on: :collection
  end
  resources :proposals, only: [:new]
end
