Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'audio_books/new'
  resources :audio_books

  scope ActiveStorage.routes_prefix do
    get '/blobs/redirect/:signed_id/*filename' => 'admin/blobs#show'
  end

  get '/audio_books/:id/file', to: 'audio_books#file', as: 'audio_books_file'
end
