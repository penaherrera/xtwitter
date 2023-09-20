class CreateQuotes < ActiveRecord::Migration[7.0]
  def change
    create_table :quotes do |t|
      t.string :content
      t.string :quoted_tweet_id
      t.string :author_username

      t.timestamps
    end
  end
end
