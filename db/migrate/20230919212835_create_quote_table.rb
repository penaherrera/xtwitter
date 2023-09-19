class CreateQuoteTable < ActiveRecord::Migration[7.0]
  def change
    create_table :quote_tables do |t|
      t.integer :id
      t.string :content
      t.integer :quoted_tweet_id
      t.string :author_username

      t.timestamps
    end
  end
end
