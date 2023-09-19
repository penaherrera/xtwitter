class CreateFollowerTable < ActiveRecord::Migration[7.0]
  def change
    create_table :follower_tables do |t|
      t.integer :id
      t.string :follow_username
      t.string :following_username

      t.timestamps
    end
  end
end
