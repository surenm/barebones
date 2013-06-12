App::Application.routes.draw do
  match '/' => 'application#index'
  match 'home/new' => 'home#new'
end
