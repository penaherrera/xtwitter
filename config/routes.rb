Rails.application.routes.draw do
  devise_for :users
  root "main#home"
  
  
  get 'main/home'
  namespace :api do
    
    resources :tweets do
      member do
        post 'tweet', to: 'tweets#create'
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
end
