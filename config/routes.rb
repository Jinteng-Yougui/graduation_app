Rails.application.routes.draw do
  root 'contacts#index'
  resources :bookings
  devise_for :users
  resources :contacts do
    collection do
      post :confirm
      get 'search'
    end
  end
  resources :categories, only: [:new, :create, :index, :edit, :destroy]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
