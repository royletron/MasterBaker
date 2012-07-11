class AddDefaultPictureValue < ActiveRecord::Migration
  def up
    change_column :users, :picture, :default => "default.png"
  end

  def down
  end
end
