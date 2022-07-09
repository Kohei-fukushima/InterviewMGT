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




  devise_for :admin,skip:[:registrations,:passwords], controllers:{
      sessions: "admin/sessions"
  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
