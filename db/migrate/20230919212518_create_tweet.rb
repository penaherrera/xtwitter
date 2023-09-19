class CreateTweet < ActiveRecord::Migration[7.0]
  def change
    create_table :tweets do |t|
      t.integer :id
      t.string :body
      t.string :author_username

      t.timestamps
    end
  end
end
