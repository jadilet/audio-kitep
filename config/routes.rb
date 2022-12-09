Rails.application.routes.draw do
  get 'audio_books/new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :audio_books

  get '/audio_books/:id/file', to: 'audio_books#file', as: 'audio_books_file'
end
