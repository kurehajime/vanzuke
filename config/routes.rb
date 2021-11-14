Rails.application.routes.draw do
  root :to => 'make#index'
  get "make" => "make#index"
  get "ranks" => "ranks#index"
end
