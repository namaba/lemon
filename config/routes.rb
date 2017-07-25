Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :registrations => 'users/registrations' }

  root :to => 'guest/pages#index'

  scope '/', module: 'guest' do
    get 'pages/welcome'

    resources :users, only: [:show, :create, :edit, :update, :destroy] do
      get 'preview',                to: 'users#preview'
    end
    resources :searches, only: [:index, :show]
    resources :likes, only: [:index, :show, :create] do
      member do
        get 'match',              to: 'likes#match'
      end
    end
    resources :messages, only: [:index, :show, :create] do
      member do
        get 'profile',                to: 'messages#profile'
      end
    end
    resources :communities do
      member do
        get 'my_communities',     to: 'communities#my_communities'
        get 'detail',            to: 'communities#detail'
        get 'join',              to: 'communities#join'
      end
    end
    resources :topics do
      member do
        post 'chat',                to: 'topics#chat'
      end
    end
    resources :murmurs
    resources :murmur_comments
    resources :murmur_smiles, only: [:create, :destroy]
    resources :charges

  end

  #----------------------------------------
  #  Admin
  #----------------------------------------

  get '/admin', to: 'admin/user#index', as: :admin
  scope '/admin', module: 'admin', as: :admin do
    resources :user do
      collection do
        get   'premium_users',             to: 'user#premium_users', as: :premium
        get   'canceled_users',            to: 'user#canceled_users', as: :canceled
        get   'men',                       to: 'user#men'
        get   'women',                     to: 'user#women'
        get   'paying_users',              to: 'user#paying_users', as: :paying
        get   'normal_users',              to: 'user#normal_users', as: :normal
        get   'no_match',                  to: 'user#no_match'
      end
    end

    resources :searchs, only: [:index]

    resources :announcement do
      member do
        delete 'all_destroy',                 to: 'announcement#all_destroy'
      end
    end
  end
  #----------------------------------------
  #  Admin/Premium
  #----------------------------------------
  get '/premium', to: 'premium/user#index', as: :premium
  scope '/premium', module: 'premium', as: :premium do
    resources :user do
      collection do
        # match 'pre_new',                       to: 'user#pre_new',  via: 'get'
        get   'pre_new',                       to: 'user#pre_new'
        post   'pre_new',                       to: 'user#pre_create'
        get   'pre_notice',                    to: 'user#pre_notice'
      end
    end
  end

end
