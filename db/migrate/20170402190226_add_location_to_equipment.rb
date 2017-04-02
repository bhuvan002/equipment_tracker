class AddLocationToEquipment < ActiveRecord::Migration[5.0]
  def change
    add_column :equipment, :location, :string
  end
end
