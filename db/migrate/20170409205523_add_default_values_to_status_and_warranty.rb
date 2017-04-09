class AddDefaultValuesToStatusAndWarranty < ActiveRecord::Migration[5.0]
  def change
    change_column :equipment, :status, :string, default: 'OK'
    change_column :equipment, :warranty_status, :string, default: 'OK'
  end
end
