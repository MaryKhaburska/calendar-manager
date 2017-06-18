Rails.application.routes.draw do
  resources :calendars
  resources :events

  root "calendars#index"
end
