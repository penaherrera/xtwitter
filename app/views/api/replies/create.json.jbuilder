json.id @reply.id
json.content @reply.content
json.tweet_id @reply.tweet_id
json.author_id @reply.author_id
json.created_at @reply.created_at.strftime("%Y-%m-%dT%H:%M:%SZ")
json.updated_at @reply.updated_at.strftime("%Y-%m-%dT%H:%M:%SZ")