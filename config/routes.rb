Rails.application.routes.draw do
  devise_for :freelancers, path: 'freelancers', controllers: { registrations: "registrations" }
  devise_for :owners, path: 'owners'
  root to: 'home#index'
  resources :profiles, only: [:new, :create, :show] do
  end
  resources :projects, only: [:new, :show, :create] do
    get 'my_projects', on: :collection
    resources :proposals, only: [:create, :show], shallow:true
  end
end
