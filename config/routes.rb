Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'main#home'

  get '/search',  to: 'main#search'
  get '/about',   to: 'main#about'

  get '*path' => redirect('/')
end
