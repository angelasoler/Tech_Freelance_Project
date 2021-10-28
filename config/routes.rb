Rails.application.routes.draw do
  devise_for :freelancers, path: 'freelancers', controllers: { registrations: "registrations", sessions: "sessions" }
  devise_for :owners, path: 'owners'
  root to: 'home#index'
  resources :profiles, only: [:new, :create, :show]
  resources :projects, only: [:new, :show, :create] do
    get 'my_projects', on: :collection
    resources :proposals, only: [:create]
  end
  resources :proposals,  only: [:create, :show, :update, :edit] do
    patch 'accept', on: :collection
    patch 'turn_down', on: :collection
  end
end
