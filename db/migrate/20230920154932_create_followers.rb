class CreateFollowers < ActiveRecord::Migration[7.0]
  def change
    create_table :followers do |t|
      t.references :follower, null: false, foreign_key: { to_table: :authors }
      t.references :following, null: false, foreign_key: { to_table: :authors }

      t.timestamps
    end
  end
end

