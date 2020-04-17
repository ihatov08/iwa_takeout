Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: "home#index"

  resources :listings, only: %i[index show]
  resources :foods, only: %i[index show]

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
