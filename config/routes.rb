Rails.application.routes.draw do
  #get 'session/create'
  #get 'session/destroy'
  devise_for :authors, controllers: {registrations: 'registration'}
  #root to: 'authors/sessions#create'
  namespace :api do
    delete 'logout', to: 'session#destroy'
    post 'login', to: 'session#create'
    post 'register', to: 'registration#create'
    post :auth, to: "authentication#create"
    resources :tweets do
      member do
        get 'stats', to: 'tweets#tweet_stats'
        post 'reply', to: 'replies#create'
        post 'quote', to: 'quotes#create'
        post 'bookmark', to: 'bookmarks#create'
        post 'retweet', to: 'retweets#create'
        post 'like', to: 'likes#create'
        delete 'unlike', to: 'likes#destroy'
      end
    end

    resources :authors do
      member do
        get 'tweets', to: 'tweets#author_tweets'
        get 'tweets_and_replies', to: 'tweets#author_tweets_and_replies'
      end

    end
  end

  namespace :web do
    resources :tweets
  end
end
