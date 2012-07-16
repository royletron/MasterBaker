class AddCoverToUsers < ActiveRecord::Migration
  def up
    change_table :users do |t|
      t.has_attached_file :cover
    end
  end
  def down
    drop_attached_file :users, :cover
  end
end
