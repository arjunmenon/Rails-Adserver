Rails.application.routes.draw do
  devise_for :users

  mount RailsAdserver::Engine => "/rails_adserver"
  root :to => 'page#home'
  devise_scope :user do
    get "/login" => "devise/sessions#new"
    delete "/logout" => "devise/sessions#destroy"
  end
end
