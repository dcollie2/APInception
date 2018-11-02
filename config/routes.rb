Rails.application.routes.draw do
  get 'entrance/index'
  root 'entrance#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
