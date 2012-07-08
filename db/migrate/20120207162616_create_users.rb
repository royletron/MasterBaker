class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :username
      t.string :encrypted_password
      t.string :salt
      t.string :picture
      t.boolean :admin, :default => false
      t.boolean :superadmin, :default => false
      t.boolean :god, :default => false

      t.timestamps
    end
  end
  def down
    drop_table :users
  end
end