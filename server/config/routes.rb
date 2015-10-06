Rails.application.routes.draw do
  get 'article', :to => 'article#index'
  post 'user', :to => 'user#index'
end
