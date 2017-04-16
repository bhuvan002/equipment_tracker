class CreateMoveRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :move_requests do |t|
      t.references :equipment, foreign_key: true
      t.integer :from_id
      t.integer :to_id
      t.boolean :hod_approved, default: false
      t.boolean :to_approved, default: false

      t.timestamps
    end
    add_index :move_requests, :from_id
    add_index :move_requests, :to_id
  end
end
