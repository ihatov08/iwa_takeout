Rails.application.routes.draw do
  resources :listings
  root to: "home#index"
end
