class CreateFollowers < ActiveRecord::Migration[7.0]
  def change
    create_table :followers do |t|
      t.string :follower_username
      t.string :following_username

      t.timestamps
    end
  end
end
