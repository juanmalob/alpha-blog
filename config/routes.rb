Rails.application.routes.draw do
  resources :articles #tambien metemos todas las rutas RESTful to rails resources

  #resources :articles, only: [:show, :index, :new, :create, :edit, :update, :delete, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "pages#home"

  get 'about', to: 'pages#about'
end
