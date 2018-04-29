Rails.application.routes.draw do
  root 'welcome#index'

  resources :organizations do
    collection do
      post 'unique_org_name_check'
    end
  end
  devise_for :users
  resources :admins, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
