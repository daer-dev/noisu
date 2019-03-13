# frozen_string_literal: true

Rails.application.routes.draw do
  resources :boards do
    resources :notes
  end

  root "boards#index"
end
