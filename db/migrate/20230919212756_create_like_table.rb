class CreateLikeTable < ActiveRecord::Migration[7.0]
  def change
    create_table :like_tables do |t|
      t.integer :id
      t.integer :tweet_id
      t.string :author_username

      t.timestamps
    end
  end
end
