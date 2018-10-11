Rails.application.routes.draw do
  resources :boards do
    resources :notes
  end

  root 'boards#index'
end
