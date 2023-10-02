json.id @quote.id
json.id @quote_content.content
json.tweet_id @quote.tweet_id
json.author_id @quote.author_id
json.created_at @quote.created_at.strftime("%Y-%m-%dT%H:%M:%SZ")
json.updated_at @quote.updated_at.strftime("%Y-%m-%dT%H:%M:%SZ")