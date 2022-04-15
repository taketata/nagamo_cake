Rails.application.routes.draw do

  scope module: :public do

    root to: 'homes#top'

    get 'about' => 'homes#about'

    get 'customers/confirm' => 'customers#confirm'

    patch 'customers/withdrawal' => 'customers#withdrawal'

    get 'customers' => 'customers#show'

    get 'customers/edit' => 'customers#edit'

    patch 'customers' => 'customers#update'

  end

  namespace :admin do

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
