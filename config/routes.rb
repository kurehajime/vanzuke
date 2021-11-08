Rails.application.routes.draw do
  get "make" => "make#index"
  get "ranks" => "ranks#index"
end
