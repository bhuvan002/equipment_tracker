class Equipment < ApplicationRecord
  belongs_to :lab_owner
  has_many :location_histories
end
