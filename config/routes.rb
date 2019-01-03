Rails.application.routes.draw do
  resources :payments, except: :destroy

  root "payments#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
