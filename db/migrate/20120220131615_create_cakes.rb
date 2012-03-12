class CreateCakes < ActiveRecord::Migration
  def change
    create_table :cakes do |t|
      t.string :name
      t.integer :user_id

      t.timestamps
    end
  end
end
