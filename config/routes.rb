Rails.application.routes.draw do
  resources :outfit_items
  resources :outfits
  resources :item_categories
  resources :categories
  resources :items
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
