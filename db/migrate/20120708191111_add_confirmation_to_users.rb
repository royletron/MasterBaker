class AddConfirmationToUsers < ActiveRecord::Migration
  def up
    add_column :users, :confirmed, :boolean, :default => false

    add_column :users, :confirm_code, :string

  end
  def down
    remove_column :users, :confirmed, :boolean

    remove_column :users, :confirm_code, :string
  end
end
