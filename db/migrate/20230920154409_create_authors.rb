class CreateAuthors < ActiveRecord::Migration[7.0]
  def change
    create_table :authors do |t|
      t.string :username
      t.string :name
      t.string :lastname
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end
