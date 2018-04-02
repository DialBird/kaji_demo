Rails.application.routes.draw do
  namespace :user do
    root 'home#index'
  end
end
