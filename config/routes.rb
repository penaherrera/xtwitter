Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :tweets do
    member do
      get 'stats', to: 'tweets#tweet_stats'
      post 'create', to: 'tweets#create'
      put 'update', to: 'tweets#update'
      post 'reply', to: 'replies#create'
      post 'quote', to: 'quotes#create'
      post 'bookmark', to: 'bookmarks#create'
      post 'retweet', to: 'retweets#create'
      post 'like', to: 'tweets#like'
      delete 'unlike', to: 'likes#destroy'
    end
  end
  
  resources :authors do
    member do
      get 'tweets', to: 'tweets#author_tweets'
      get 'tweets_and_replies', to: 'tweets#author_tweets_and_replies'
    end

  end


  #post 'tweets/create', to: 'tweets#create'


  
  #Bookmark: Route a user would use to bookmark an existent tweet
  #Reply: Route a user would use to reply an existent tweet
  #Quote: Route a user would use to Quote an existent tweet
  #Retweet: Route a user would use to retweet an existent tweet
  # Defines the root path route ("/")
  # root "articles#index"
end
