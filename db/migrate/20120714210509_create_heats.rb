class CreateHeats < ActiveRecord::Migration
  def up
    create_table :heats do |t|
      t.string :name
      t.string :pagecontent
      t.has_attached_file :picture

      t.timestamps
    end
  end
  def down
    drop_table :heats
  end
end
