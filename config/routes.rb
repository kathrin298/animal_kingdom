Rails.application.routes.draw do
  devise_for :users
  root to: 'animals#index'
  resources :animals, only: [:index, :new, :create, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #TODO resources :booking, only [:] do
  resources :reviews, only: [:create, :new]

end
