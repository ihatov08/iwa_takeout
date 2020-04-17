Rails.application.routes.draw do
  root to: "home#index"

  resources :listings, only: %i[index show]
  resources :foods, only: %i[index show]

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
