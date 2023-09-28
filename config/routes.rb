Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :tweets, only: [] do
    post 'create', on: :collection
    put 'update', on: :member
    post 'like', on: :member, to: 'likes#create'
    delete 'unlike', on: :member, to: 'likes#destroy'
    post 'retweet', on: :member, to: 'retweets#create'
    post 'bookmark', on: :member, to: 'bookmarks#create'
    post 'quote', on: :member, to: 'quotes#create'
    post 'reply', on: :member, to: 'replies#create'
  end
  
  #Bookmark: Route a user would use to bookmark an existent tweet
  #Reply: Route a user would use to reply an existent tweet
  #Quote: Route a user would use to Quote an existent tweet
  #Retweet: Route a user would use to retweet an existent tweet
  # Defines the root path route ("/")
  # root "articles#index"
end
