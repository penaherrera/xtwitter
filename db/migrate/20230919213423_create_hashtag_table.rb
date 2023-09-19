class CreateHashtagTable < ActiveRecord::Migration[7.0]
  def change
    create_table :hashtag_tables do |t|
      t.integer :hashtag_id
      t.string :name

      t.timestamps
    end
  end
end
