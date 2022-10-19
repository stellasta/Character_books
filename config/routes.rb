Rails.application.routes.draw do
  resources :blogs
  root 'top#home' 

  get 'create/create'
  get "users/signin_form" => "users#signin_form"
  post "users/signin" => "users#signin"

  get 'users/login_form' => "users#login_form"
  post "users/login" => "users#login"
  get "users/:id/user_home" => "users#user_home"
  get "users/logout" => "users#logout"

  get "top/home" => "top#home"

  get "create/create_form" => "create#create_form"
  post "create/create" => "create#create"
  get "create/:id/show" => "create#show"
  get "create/:id/group" => "create#group"
  get "create/:id/edit" => "create#edit"
  post "create/:id/update" => "create#update"
  get "create/:id/destroy" => "create#destroy"
 
end
