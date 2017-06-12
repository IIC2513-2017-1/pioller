# frozen_string_literal: true

json.user do
  json.href api_v1_user_url(@user)
  json.email @user.email
  json.first_name @user.first_name
  json.last_name @user.last_name
  json.tweets do
    json.array! @user.tweets do |tweet|
      json.href api_v1_tweet_url(tweet)
      json.content tweet.content
      json.private tweet.private
    end
  end
end
