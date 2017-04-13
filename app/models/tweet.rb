# frozen_string_literal: true

##
# Model for tweets
class Tweet < ApplicationRecord
  validates :content, presence: true, allow_blank: false

  has_many :comments
  has_many :attachments
  belongs_to :user
end
