json.stats do
    json.quoted @tweet.quotes
    json.retweets @tweet.retweets
    json.replies @tweet.replies
    json.likes @tweet.likes
  end