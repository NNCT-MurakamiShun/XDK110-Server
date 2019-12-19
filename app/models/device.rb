class Device < ApplicationRecord
  has_many :sensors, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
