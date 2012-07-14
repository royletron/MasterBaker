class CreateCompetitions < ActiveRecord::Migration
  def up
    create_table :competitions do |t|
      t.string :name
      t.string :pagecontent
      t.column :startdate, :datetime
      t.column :enddate, :datetime

      t.timestamps
    end
  end
  def down
    drop_table :competitions
  end
end
