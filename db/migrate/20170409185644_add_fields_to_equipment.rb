class AddFieldsToEquipment < ActiveRecord::Migration[5.0]
  def change
    add_column :equipment, :status, :string
    add_column :equipment, :warranty_status, :string
  end
end
