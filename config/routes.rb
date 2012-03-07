RailsAdserver::Engine.routes.draw do
  resources :adspaces

  resources :advertisements
  root :to => 'pages#home'
  match '/ad_rotator/:id',                      :to => 'pages#rotator'
  match '/click/:id',                           :to => 'advertisements#click',  :as => 'ad_click'
  match '/ad/space/:adspace_id/param/:id',      :to => 'advertisements#ad'
end
