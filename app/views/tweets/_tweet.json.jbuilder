json.extract! tweet, :id, :content, :private, :created_at, :updated_at
json.url tweet_url(tweet, format: :json)
