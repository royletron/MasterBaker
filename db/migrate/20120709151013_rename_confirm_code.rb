class RenameConfirmCode < ActiveRecord::Migration
  def up
    rename_column :users, :confirm_code, :confirmcode
  end

  def down
  end
end
