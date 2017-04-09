class ChangeApprovedDataTypeForEquipment < ActiveRecord::Migration[5.0]
  def up
    rename_column :equipment, :approved, :approved_boolean
    add_column :equipment, :approved, :string, default: 'Pending'
    execute "UPDATE equipment SET approved = 'Approved' WHERE approved_boolean = 'true'"
    execute "UPDATE equipment SET approved = 'Not approved' WHERE approved_boolean = 'false'"
    remove_column :equipment, :approved_boolean
  end
end
