Rails.application.routes.draw do
  get 'events/index'

  get 'events/show'

  resources :registered_applications
  resources :events


  devise_for :users

  get 'about' => 'welcome#about'


  root 'welcome#index'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
