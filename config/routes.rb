Project2::Application.routes.draw do

  root 'site#index'

  resources :menus do
    resources :menu_items
  end

  get    'login'  => 'session#new'
  post   'login'  => 'session#create'
  delete 'logout' => 'session#destroy'
  get    'logout' => 'session#destroy' #TODO: remove before deployment

  get  'register' => 'registration#new', as: :register
  post 'register' => 'registration#create'

  get   'reset/:code' => 'password#edit', as: :reset
  patch 'reset/:code' => 'password#update'

  post 'send_mail' => 'contact#send_mail'

  get  'privacy' => 'site#privacy'
  get    'terms' => 'site#terms'
  get     'home' => 'site#index'
  get     'menu' => 'site#menu'
  get   'photos' => 'site#photos'
  get 'location' => 'site#location'
  get  'contact' => 'site#contact'

end