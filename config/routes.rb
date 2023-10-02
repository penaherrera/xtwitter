Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

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



  # Defines the root path route ("/")
  # root "articles#index"
end
