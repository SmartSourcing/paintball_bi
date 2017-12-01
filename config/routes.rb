Rails.application.routes.draw do

  root :to => 'home#index'
  get 'home/index' => 'home#index'
  get 'home/show' => 'home#show'
  get 'home/list' => 'home#list'
end
