Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
 resources :posts do
   member do
     put "like", to: "posts#upvote"
 end
   resources :comments
 end
  authenticated :user do
    root 'posts#index', as: "authenticated_root"
  end
      root 'welcome#index'
  get '/auth/:facebook/callback' => 'authenticate#create'

end
