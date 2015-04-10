Rails.application.routes.draw do
  #For future development, these routes can be translated
  #using route_translator. This could not be set up in time
  # without causing the entire build to cease functioning. 
  # The required translations can be located within
  # config/locales/ and this can very easily be exanded on
  #in the future. All routes here would then be required to
  #be encapsulated within a localized block, such as
  #localized do
  root             'static_pages#home'
  get 'about'   => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  get 'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  get 'nokogiri'=> 'nokogiri#index'
  resources :users
end
