class LabOwner < User
  has_many :equipment
  has_many :send_requests, class_name: "MoveRequest",
                          foreign_key: "from_id",
                          dependent: :destroy
  has_many :receive_requests, class_name: "MoveRequest",
                            foreign_key: "to_id",
                            dependent: :destroy
end
