Rails.application.routes.draw do
  devise_for :users
  resources :projects do
    resources :tasks do
      member do
        patch :complete
      end
    end
  end

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root "projects#index"
end
