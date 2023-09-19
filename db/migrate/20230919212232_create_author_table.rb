class CreateAuthorTable < ActiveRecord::Migration[7.0]
  def change
    create_table :author_tables do |t|
      t.string :username
      t.string :name
      t.string :lastname
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end
