Rails.application.routes.draw do


  devise_for :users
  root to: 'homes#top'
  get 'users/show'


  resources :books, only:[:new, :create, :index, :show, :destroy]do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

 resources :users, only:[:show, :edit, :update]



end