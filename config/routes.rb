Rails.application.routes.draw do
  
  get '/' => 'homes#top'
  resources :books, except: [:new]
  get 'books' => 'books#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
