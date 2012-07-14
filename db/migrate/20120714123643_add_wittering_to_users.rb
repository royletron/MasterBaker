class AddWitteringToUsers < ActiveRecord::Migration
  def up
    add_column :users, :wittering, :string
  end
  
  def down
    remove_column :users, :wittering
  end
end
