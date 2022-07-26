Rails.application.routes.draw do
  root to: "homes#top"
  get "about" => "homes#about"

  namespace :public do
    resources :users, except:[:new] do
        resource :relationships, only: [:create, :destroy]
          get :followings, on: :member
          get :followers, on: :member

    member do
      get :favorites
    end

  end
    get "search" => "searchs#search"
    resources :interviews do
     resource :favorites, only: [:create, :destroy]
     resources :interview_comments, only:[:create, :destroy]
    end
  end

   namespace :admin do
    resources :users, except:[:new]
    get "search" => "searchs#search"
    resources :interviews, only: [:index, :show, :destroy]
    resources :interview_comments, only:[:create, :destroy]
  end

  devise_for :users,skip:[:passwords], controllers:{
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }
  devise_for :admin,skip:[:registrations,:passwords], controllers:{
      sessions: "admin/sessions"
  }


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
