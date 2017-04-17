class Equipment < ApplicationRecord
  belongs_to :lab_owner
  has_many :location_histories

  def update_location_history
    
    last_history = location_histories.order(created_at: :desc).first
    if !request? && !in_transit? && (last_history.nil? || (lab_owner.lab != last_history.location))
      location_histories.create(location: lab_owner.lab)
    end
  end
end
