json.id @tweet.id
json.body @tweet.body
json.author_id @tweet.author_id
json.created_at @tweet.created_at.strftime("%Y-%m-%dT%H:%M:%SZ")
json.updated_at @tweet.updated_at.strftime("%Y-%m-%dT%H:%M:%SZ")