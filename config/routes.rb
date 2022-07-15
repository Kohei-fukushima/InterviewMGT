Rails.application.routes.draw do

  root to: "homes#top"
  get "about" => "homes#about"

  namespace :public do
    resources :users, except:[:new]
    get 'users/quit'
    get 'users/out'
    get "search" => "searchs#search"
    resources :interviews
     resource :favorites, only: [:create, :destroy]
    resources :interview_comments, only:[:create, :destroy]
  end

  devise_for :users,skip:[:passwords], controllers:{
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }
  devise_for :admin,skip:[:registrations,:passwords], controllers:{
      sessions: "admin/sessions"
  }
    namespace :admin do
    resources :interview_comments, only:[:create, :destroy]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
