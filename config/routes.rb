Rails.application.routes.draw do
  resources :visitors, only: [:index, :create, :destroy, :update], defaults: {format: :json}
  root to: "visitors#index"
end