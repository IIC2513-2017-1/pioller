# frozen_string_literal: true

json.tweet do
  json.href api_v1_tweet_url(@tweet)
  json.content @tweet.content
  json.private @tweet.private
  json.user do
    json.href api_v1_user_url(@tweet.user)
    json.email @tweet.user.email
    json.first_name @tweet.user.first_name
    json.last_name @tweet.user.last_name
  end
end
