Rails.application.routes.draw do
  resources :artists do
   resources :songs, only: [:new, :create, :index]
 end
 resources :songs, only: [:show, :destroy, :index]# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
