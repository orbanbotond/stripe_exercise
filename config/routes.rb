Rails.application.routes.draw do
  resources :payments, except: [:destroy, :edit] do
    member do
      put 'refund'
    end
  end

  root to: redirect(path: :payments)
  # root "payments#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
