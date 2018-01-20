Rails.application.routes.draw do
  get 'users/index'

  get 'users/show'

  devise_for :admins, controllers: {
  	sessions: 		 'admins/sessions',
  	passwords: 		 'admins/passwords',
  	registrations: 'admins/registrations'
  }
  devise_for :users, controllers: {
  	sessions: 		 'users/sessions',
  	passwords: 		 'users/passwords',
  	registrations: 'users/registrations'
  }
  resources :users, only: [:index, :show] do
    get :favorites, on: :member
  end
  resources :posts do
    resource :favorites, only: [:create, :destroy]
  end
  root 'posts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
