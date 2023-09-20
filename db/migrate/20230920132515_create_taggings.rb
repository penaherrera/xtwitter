class CreateTaggings < ActiveRecord::Migration[7.0]
  def change
    create_table :taggings do |t|
      t.string :tweet_id
      t.string :hashtag_id

      t.timestamps
    end
  end
end
