class CreateCreateJoinTableHastagsTweets < ActiveRecord::Migration[7.0]
  def change
    create_table :create_join_table_hastags_tweets do |t|
      t.string :hashtags
      t.string :tweets

      t.timestamps
    end
  end
end
