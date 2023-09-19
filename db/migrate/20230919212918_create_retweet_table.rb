class CreateRetweetTable < ActiveRecord::Migration[7.0]
  def change
    create_table :retweet_tables do |t|
      t.integer :id
      t.integer :original_tweet_id
      t.string :author_username

      t.timestamps
    end
  end
end
