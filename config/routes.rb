Rails.application.routes.draw do
  devise_for :users, controller: {
    sessions: 'devise/sessions',
    registrations: 'devise/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to:'homes#top'
  get 'home/about' => 'homes#about', as: 'about'
  resources :books,only: [:create, :index, :show, :destroy, :edit, :update] do
     resources :book_comments,only: [:create, :destroy]
     resource :like, only: [:create, :destroy]
   end
  resources :users,only: [:show, :index, :edit, :update]

end
