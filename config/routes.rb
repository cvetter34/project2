Project2::Application.routes.draw do

  root 'site#index'

  get    'login'  => 'session#new'
  post   'login'  => 'session#create'
  delete 'logout' => 'session#destroy'
  get    'logout' => 'session#destroy' #TODO: remove before deployment

  get 'register' => 'registration#new', as: :register
  post 'register' => 'registration#create'

  get 'reset/:code' => 'password#edit', as: :reset
  patch 'reset/:code' => 'password#update'

  get 'privacy' => 'site#privacy'
  get 'terms' => 'site#terms'

  get 'home' => 'splash#home'
  get 'menu' => 'splash#menu'
  get 'photos' => 'splash#photos'
  get 'location' => 'splash#location'
  get 'contact' => 'splash#contact'

end
