Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  #get 'new_article', to: 'articles#new'
  resources :users, only: [:index, :show, :new, :create]
  
  resources :articles do
    collection do
      get :pregnant
      get :birth
      get :child_care
    end
  end  
end
