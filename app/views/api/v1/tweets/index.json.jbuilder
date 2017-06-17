# frozen_string_literal: true

json.tweets do
  json.array! @tweets do |tweet|
    json.id tweet.id
    json.href api_v1_tweet_url(tweet)
    json.content tweet.content
    json.private tweet.private
    json.user do
      json.id tweet.user.id
      json.href api_v1_user_url(tweet.user)
      json.email tweet.user.email
      json.first_name tweet.user.first_name
      json.last_name tweet.user.last_name
    end
  end
end
