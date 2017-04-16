class MoveRequest < ApplicationRecord
  belongs_to :equipment
  belongs_to :from, class_name: "LabOwner"
  belongs_to :to, class_name: "LabOwner"

  def move_equipment
    if to_approved == 'Approved' && hod_approved == 'Approved'
      equipment.update_attributes(lab_owner_id: to_id, in_transit: false)
      equipment.save
    end
  end
end
