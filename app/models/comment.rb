# frozen_string_literal: true

##
# Model for comments
class Comment < ApplicationRecord
  validates :content, presence: true, allow_blank: false

  belongs_to :user
  belongs_to :tweet
end
