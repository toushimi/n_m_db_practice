Rails.application.routes.draw do
  root 'static_pages#home'
  get  'signup', to: 'users#new'
  get 'login',  to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'mypage', to: 'users#mypage'
  resources :users
  resources :groups
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
