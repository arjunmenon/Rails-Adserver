RailsAdserver::Engine.routes.draw do
  resources :adspaces

  resources :advertisements
  root :to => 'pages#home'
  match '/ad_rotator/:id',    :to => 'pages#rotator'
  match '/click/:id',         :to => 'advertisements#click',  :as => 'ad_click'
end
