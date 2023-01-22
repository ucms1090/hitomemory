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
    get 'memories/search'
    resources :memories
    get 'posts/index', as: :memory_root
    resources :posts, except: [:index]
  end

  root 'homes#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
