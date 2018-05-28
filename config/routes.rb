Rails.application.routes.draw do
  root 'home#index'

  get '/css-exam' => 'css_exam#index'
  get '/ruby-exam' => 'ruby_exam#index'

  resources :rails_exam, only: :index do
    collection do
      get 'errors'
      get 'backend'
      get 'backend02'
      get 'active_record_exam'
    end
  end

  resources :books, only: :create
  resources :authors, only: :show
end
