# frozen_string_literal: true

##
# Model for users
class User < ApplicationRecord
  validates :password, presence: true, length: { minimum: 6 },
                       confirmation: true, allow_blank: false
  validates :email, presence: true, uniqueness: true, allow_blank: false,
                    format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  has_many :comments
end
