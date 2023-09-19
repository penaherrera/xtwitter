class CreateBookmarkTable < ActiveRecord::Migration[7.0]
  def change
    create_table :bookmark_tables do |t|
      t.integer :id
      t.integer :tweet_id
      t.string :author_username

      t.timestamps
    end
  end
end
