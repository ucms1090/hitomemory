Rails.application.routes.draw do

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
    resource :users, only: [:edit, :update, :create, :destroy]
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
