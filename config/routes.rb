Rails.application.routes.draw do

  devise_for :users
  root 'evergreen#index'

  scope 'api' do
    namespace :admin do
      resources :users, :only => [:index, :show, :update]
      resources :site_info, :only => [:index, :update]
    end
    resources :users, :only => [:index] do
      resources :resources, :only => [:index, :show, :destroy]
    end
    resources :sectors do
      collection do
        get 'overview'
      end
    end
    resources :categories, :only => [:index, :create, :update, :destroy]
    resources :collections, only: %i(index create update destroy show) do
      resources :resources, :only => [:index]
      collection do
        get 'homepage'
      end
    end
    resources :resources, :only => [:index, :create, :show, :update] do
      collection do
        get 'search'
      end
      post 'upvote', :on => :member
    end
  end

end