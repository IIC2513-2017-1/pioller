# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database
# with its default values.
# The data can then be loaded with the rails db:seed command
# (or created alongside the database with db:setup).
#
# Examples:
#
# movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# Character.create(name: 'Luke', movie: movies.first)

require 'faker'

# Destroy all
User.destroy_all
Tweet.destroy_all

# Create Users
5.times do
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.unique.email,
    password: Faker::Internet.password
  )
end

u = User.create(
  first_name: 'Rodrigo',
  last_name: 'Saffie',
  email: ENV['EMAIL'],
  password: '123456'
)
u.generate_token_and_save
u.following << User.all.limit(3)
u.followers << User.all.limit(4)

# Create tweets

user_ids = User.pluck(:id)
30.times do
  Tweet.create(
    content: Faker::Lorem.sentence,
    private: Faker::Boolean.boolean,
    user_id: user_ids.sample
  )
end

# Create comments

tweet_ids = Tweet.pluck(:id)
50.times do
  Comment.create(
    content: Faker::Lorem.sentence,
    user_id: user_ids.sample,
    tweet_id: tweet_ids.sample
  )
end
