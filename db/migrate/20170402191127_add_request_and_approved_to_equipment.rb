class AddRequestAndApprovedToEquipment < ActiveRecord::Migration[5.0]
  def change
    add_column :equipment, :request, :boolean, default: false
    add_column :equipment, :approved, :boolean, default: false
  end
end
