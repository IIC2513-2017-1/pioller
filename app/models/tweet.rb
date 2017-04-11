# frozen_string_literal: true

##
# Model for tweets
class Tweet < ApplicationRecord
  validates :content, presence: true, allow_blank: false
end
