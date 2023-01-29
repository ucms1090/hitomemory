Rails.application.routes.draw do

  devise_for :admins, skip: [:passwords], controllers: {
    registrations: "admin/registrations",
    sessions: 'admin/sessions'
  }

  namespace :admin do
    resources :memories, only: [:index]
    resources :users, only: [:index]
    resources :posts, only: [:index]
  end

  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/users/registrations",
    sessions: 'public/users/sessions'
  }

  devise_for :memories, skip: [:passwords], controllers: {
    registrations: "public/memories/registrations",
    sessions: 'public/memories/sessions'
  }

  scope module: 'public' do
    resource :users, only: [:show], as: :user_root
    get 'users/information/edit', to: 'users#edit', as: 'edit_information'
    patch 'users/information', to: 'users#update', as: 'information'
    get 'users/unsubscribe', to: 'users#unsubscribe', as: 'unsubscribe'
    patch 'users/withdraw', to: 'users#withdraw', as: 'withdraw'
    resource :users, only: [:update, :create, :destroy]
    post '/users/guest_sign_in', to: 'users#guest_sign_in'
    get 'memories/search'
    resources :memories
    post '/memories/guest_sign_in', to: 'memories#guest_sign_in'
    get 'posts/index', as: :memory_root
    get 'posts/search'
    resources :posts, except: [:index] do
      resources :comments , only: [:create, :destroy]
    end
  end

  root 'homes#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
