Rails.application.routes.draw do
  root "weather#index"
  get :search, controller: 'weather'
end
