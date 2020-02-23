Rails.application.routes.draw do
  resources :merchants do
    resources :transactions
  end

  root to: 'merchants#index'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
