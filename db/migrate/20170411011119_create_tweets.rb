class CreateTweets < ActiveRecord::Migration[5.0]
  def change
    create_table :tweets do |t|
      t.text :content, null: false
      t.boolean :private, null: false

      t.timestamps
    end
  end
end
