Rails.application.routes.draw do

  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  scope module: 'public' do
    resource :users, only: [:edit, :show, :update, :create, :destroy]
  end

  root 'homes#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
