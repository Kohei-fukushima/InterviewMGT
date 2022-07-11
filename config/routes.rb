Rails.application.routes.draw do
  devise_for :users,skip:[:passwords], controllers:{
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  root to: "homes#top"
  get "about" => "homes#about"

  namespace :public do
    resources :users, expect:[:quit, :out] do
    end
    get 'users/quit'
    get 'users/out'
  end
  namespace :public do
    resources :interviews
  end
  namespace :public do
    resources :interview_comments, only:[:create, :destroy]
  end




  devise_for :admin,skip:[:registrations,:passwords], controllers:{
      sessions: "admin/sessions"
  }

    namespace :admin do
    resources :interview_comments, only:[:create, :destroy]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
