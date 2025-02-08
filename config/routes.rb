Rails.application.routes.draw do
  root "payments#new"

  resources :payments, only: [:new, :create] do
    collection do
      get :success
      get :cancel
    end
  end
end
