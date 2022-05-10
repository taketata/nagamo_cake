Rails.application.routes.draw do

  scope module: :public do

    post 'orders' => 'orders#create'

    get 'orders/new' => 'orders#new'

    post 'orders/confirm' => 'orders#confirm'

    get 'orders/thanks' => 'orders#thanks'

    get 'orders/index' => 'orders#index'

    get 'orders/:id' => 'orders#show',as:'order'

    delete 'cart_items/empty' => 'cart_items#empty',as:'empty_cart_item'

    delete 'cart_items/:id' => 'cart_items#destroy',as:'destroy_cart_item'

    patch 'cart_items/:id' => 'cart_items#update',as:'update_cart_item'

    post 'cart_items' => 'cart_items#create'

    get 'cart_items' => 'cart_items#index'

    get 'items/:id' => 'items#show',as:'item'

    get 'items' => 'items#index'

    get 'addresses' => 'addresses#index'

    get 'addresses/:id/edit' => 'addresses#edit',as:'edit_address'

    post 'addresses' => 'addresses#create'

    patch 'addresses/:id' => 'addresses#update',as:'update_address'

    delete 'addresses/:id' => 'addresses#destroy',as:'destroy_address'

    root to: 'homes#top'

    get 'about' => 'homes#about'

    get 'customers/confirm' => 'customers#confirm'

    patch 'customers/withdrawal' => 'customers#withdrawal'

    get 'customers' => 'customers#show'

    get 'customers/edit' => 'customers#edit'

    patch 'customers/edit' => 'customers#update'

  end

  namespace :admin do

    resources:orders,only:[:show,:update]

    resources:customers,only:[:index,:show,:edit,:update]

    resources:items,only:[:index,:edit,:show,:new,:create,:update]

    resources:genres,only:[:index,:edit,:create,:update]

    get '/' => 'homes#top'

  end

  devise_for :admin,skip:[:registrations,:passwords], controllers: {
  sessions: "admin/sessions"
  }

  devise_for :customers,skip:[:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
