Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
  resources :projects do
    resources :tasks do
      member do
        patch :complete
      end
    end
  end

  authenticated :user do
    root "projects#index", as: "authenticated_root"
  end

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root "welcome#index"
end
