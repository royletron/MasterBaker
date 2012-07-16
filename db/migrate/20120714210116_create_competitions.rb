class CreateCompetitions < ActiveRecord::Migration
  def up
    create_table :competitions do |t|
      t.string :name
      t.string :pagecontent
      t.column :startdate, :date
      t.column :enddate, :date

      t.timestamps
    end
  end
  def down
    drop_table :competitions
  end
end
