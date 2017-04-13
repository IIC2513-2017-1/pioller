class AddTweetToComment < ActiveRecord::Migration[5.0]
  def change
    add_reference :comments, :tweet, foreign_key: true
  end
end
