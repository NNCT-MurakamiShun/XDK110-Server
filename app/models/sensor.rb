class Sensor < ApplicationRecord
  belongs_to :device
  has_many :sensor_values, dependent: :destroy

  validates :name, presence: true
  validates :name, uniqueness: { scope: :device }
end
