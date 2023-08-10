Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'bookings#index'
  resources :bookings do
    collection do
      post :confirm
      get 'search'
    end
  end
  devise_for :users
  resources :contacts
  resources :categories, only: [:new, :create, :index, :edit, :destroy]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
