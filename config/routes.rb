Rails.application.routes.draw do
  resources :calendar
  resources :event

  root "calendar#index"
end
