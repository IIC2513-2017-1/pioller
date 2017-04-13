class CreateAttachments < ActiveRecord::Migration[5.0]
  def change
    create_table :attachments do |t|
      t.string :path, null: false

      t.timestamps
    end
    add_reference :attachments, :tweet, foreign_key: true
  end
end
