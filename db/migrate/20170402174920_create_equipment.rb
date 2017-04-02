class CreateEquipment < ActiveRecord::Migration[5.0]
  def change
    create_table :equipment do |t|
      t.string :model
      t.string :type

      t.timestamps
    end
  end
end
