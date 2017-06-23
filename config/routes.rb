require 'sidekiq/web'
Rails.application.routes.draw do
  devise_for :players
  devise_for :users, skip: [:registrations]

  authenticate :user do
    mount Sidekiq::Web => 'admin/sidekiq'
  end

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'

  resources :hunts, only: [:index, :show, :create]
end
