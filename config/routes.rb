Rails.application.routes.draw do
  root 'static_pages#home'
  get  'signup', to: 'users#new'
  get 'login',  to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'mypage', to: 'users#mypage'
  get 'mypage/edit', to: 'users#edit'
  patch 'mypage/edit', to: 'users#update'
  resources :users, only: [:new,:create,:show]
  resources :groups, only: [:new,:create,:show,:edit,:update]

  post 'groups/:id/invite', to: 'groups#invite', as: 'invite'
  post 'groups/:id/kick',   to: 'groups#kick',   as: 'kick'
  post 'mypage/join',       to: 'users#join',    as: 'join'
  post 'mypage/leave',      to: 'users#leave',   as: 'leave'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
