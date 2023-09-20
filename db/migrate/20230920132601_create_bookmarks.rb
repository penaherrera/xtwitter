class CreateBookmarks < ActiveRecord::Migration[7.0]
  def change
    create_table :bookmarks do |t|
      t.string :tweet_id
      t.string :author_username

      t.timestamps
    end
  end
end
