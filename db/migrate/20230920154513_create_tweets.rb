class CreateTweets < ActiveRecord::Migration[7.0]
  def change
    create_table :tweets do |t|
      t.string :body
      t.references :author, null: false, foreign_key: true

      t.timestamps
    end
  end
end
