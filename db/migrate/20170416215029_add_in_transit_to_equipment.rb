class AddInTransitToEquipment < ActiveRecord::Migration[5.0]
  def change
    add_column :equipment, :in_transit, :boolean, default: false
  end
end
