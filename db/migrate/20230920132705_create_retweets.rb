class CreateRetweets < ActiveRecord::Migration[7.0]
  def change
    create_table :retweets do |t|
      t.string :original_tweet_id
      t.string :author_username

      t.timestamps
    end
  end
end
