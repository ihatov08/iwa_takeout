Rails.application.routes.draw do
  devise_for :users, controllers: {
    confirmations:      'users/confirmations',
    passwords:          'users/passwords',
    registrations:      'users/registrations',
    sessions:           'users/sessions',
    unlocks:            'users/unlocks',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  root to: "home#index"

  namespace :mypage do
    resources :listings
  end

  resources :listings, only: %i[index show]

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
