Rails.application.routes.draw do
  resources :calendars do
    member do
      get 'create_events'
    end
  end

  resources :events

  root "calendars#index"
end
