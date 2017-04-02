class AddLabOwnerToEquipment < ActiveRecord::Migration[5.0]
  def change
    add_reference :equipment, :lab_owner, foreign_key: true
  end
end
