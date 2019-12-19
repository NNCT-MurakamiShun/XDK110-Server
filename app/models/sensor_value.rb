class SensorValue < ApplicationRecord
  belongs_to :sensor

  validates :value, presence: true
end
