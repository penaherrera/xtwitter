class CreateHastagTable < ActiveRecord::Migration[7.0]
  def change
    create_table :hastag_tables do |t|

      t.timestamps
    end
  end
end
