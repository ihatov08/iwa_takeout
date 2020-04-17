Rails.application.routes.draw do
  devise_for :client_staffs, controllers: {
    confirmations:      'client_staffs/confirmations',
    passwords:          'client_staffs/passwords',
    registrations:      'client_staffs/registrations',
    sessions:           'client_staffs/sessions',
    unlocks:            'client_staffs/unlocks'
  }

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: "home#index"

  resources :listings, only: %i[index show]
  resources :foods, only: %i[index show]

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
