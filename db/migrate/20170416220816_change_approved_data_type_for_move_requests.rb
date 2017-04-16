class ChangeApprovedDataTypeForMoveRequests < ActiveRecord::Migration[5.0]
  def up
    rename_column :move_requests, :hod_approved, :hod_approved_boolean
    rename_column :move_requests, :to_approved, :to_approved_boolean
    add_column :move_requests, :hod_approved, :string, default: 'Pending'
    add_column :move_requests, :to_approved, :string, default: 'Pending'
    execute "UPDATE move_requests SET hod_approved = 'Approved' WHERE hod_approved_boolean = 'true'"
    execute "UPDATE move_requests SET hod_approved = 'Not approved' WHERE hod_approved_boolean = 'false'"
    execute "UPDATE move_requests SET to_approved = 'Approved' WHERE to_approved_boolean = 'true'"
    execute "UPDATE move_requests SET to_approved = 'Not approved' WHERE to_approved_boolean = 'false'"
    remove_column :move_requests, :hod_approved_boolean
    remove_column :move_requests, :to_approved_boolean
  end
end
