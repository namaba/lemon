Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, :controllers => {
    :omniauth_callbacks => "users/omniauth_callbacks",
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
    }

  root :to => 'guest/pages#index'

  scope '/', module: 'guest' do
    get 'pages/welcome'

    resources :users, only: [:show, :create, :edit, :update, :destroy] do
      get 'preview',                to: 'users#preview'
      collection do
        get 'welcome',              to: 'users#welcome'
      end
    end
    resources :searches, only: [:index, :show] do
      collection do
        get 'welcome',              to: "searches#welcome"
      end
    end
    resources :likes, only: [:index, :show, :create] do
      member do
        patch 'match',                to: 'likes#match'
      end
    end

    resources :partnerships, only: [:index, :show, :create] do
      member do
        get 'partner',              to: 'partnerships#partner'
      end
    end

    resources :messages, only: [:index, :show, :create] do
      member do
        get 'profile',              to: 'messages#profile'
      end
    end

    resources :communities do
      member do
        get 'my_communities',       to: 'communities#my_communities'
        get 'detail',               to: 'communities#detail'
        get 'join',                 to: 'communities#join'
        get 'member/:member_id',    to: 'communities#member', as: :member
        get 'member_list',          to: 'communities#member_list'
        get 'waiting_members',          to: 'communities#waiting_members'
        post 'ban_member',          to: 'communities#ban_member'
        post 'releace_member',          to: 'communities#releace_member'
        post 'approve_member',          to: 'communities#approve_member'
      end
    end
    resources :topics do
      member do
        post 'chat',                to: 'topics#chat'
      end
    end
    resources :murmurs do
      member do
        get 'writer',    to: 'murmurs#writer'
      end
    end

    resources :murmur_comments
    resources :murmur_smiles, only: [:create, :destroy]
    resources :topic_smiles, only: [:create, :destroy]
    resources :charges do
      collection do
        get 'coin_charge',          to: 'charges#coin_charge'
      end
    end

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
        delete 'all_destroy',              to: 'announcement#all_destroy'
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
        get   'pre_new',                   to: 'user#pre_new'
        post   'pre_new',                  to: 'user#pre_create'
        get   'pre_notice',                to: 'user#pre_notice'
      end
    end
    resources :messages, only: [:index, :show, :create] do
      member do
        get 'profile',                to: 'messages#profile'
      end
    end
  end

end
