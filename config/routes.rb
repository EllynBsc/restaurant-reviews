Rails.application.routes.draw do
  resources :restaurants do
     # **************************
     collection do
      get :top   # GET 'restaurants/top'
      # verb :name_of_method
     end
     # ********************************#


     member do
      get :chef  # GET /restaurants/:id/chef
     end
     # **************************
   # a restaurant has many reviews
   # a review that belongs to a restaurant
   resources :reviews, only: [:new, :create] #convention: shallow nesting, have short routes as much as possible
   # to be able to crete a review, you need the id of the restaurant
  end

  # resources :reviews, only: [:edit, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
