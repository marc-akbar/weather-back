Rails.application.routes.draw do
  root "weather#index"
  get :search, controller: 'weather'
  mount ActionCable.server, at: '/cable'
end
