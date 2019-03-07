Rails.application.routes.draw do
  resources :posts
  resources :users, param: :-username
  post '/auth/login', to: 'authentication#login'
end
