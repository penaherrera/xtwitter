class CreateReplyTable < ActiveRecord::Migration[7.0]
  def change
    create_table :reply_tables do |t|
      t.integer :id
      t.string :content
      t.string :tweet_id
      t.string :author_username

      t.timestamps
    end
  end
end
