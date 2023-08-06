Rails.application.routes.draw do
  resources :bookings
  devise_for :users
  resources :contacts do
    collection do
    post :confirm
    end
  root 'contacts#index'
  resources :categories, only: [:new, :create, :index, :edit, :destroy]
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
