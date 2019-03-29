Rails.application.routes.draw do
  resources :houses
  scope :api, defaults: { format: :json } do
    resources :houses do
      resources :students
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
