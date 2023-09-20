class CreateReplies < ActiveRecord::Migration[7.0]
  def change
    create_table :replies do |t|
      t.string :content
      t.string :tweet_id
      t.string :author_username

      t.timestamps
    end
  end
end
