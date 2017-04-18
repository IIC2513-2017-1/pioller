# frozen_string_literal: true

##
# Model for users
class User < ApplicationRecord
  validates :password, presence: true, length: { minimum: 6 },
                       confirmation: true, allow_blank: false
  validates :email, presence: true, uniqueness: true, allow_blank: false,
                    format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  has_many :comments
  has_many :tweets

  has_many :follower_relationships, foreign_key: :following_id, class_name: 'Follow'
  has_many :following_relationships, foreign_key: :follower_id, class_name: 'Follow'

  has_many :followers, through: :follower_relationships, source: :follower
  has_many :following, through: :following_relationships, source: :following
end
