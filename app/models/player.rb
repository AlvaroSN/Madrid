class Player < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :photo, presence: true
  validates :number, presence: true
  validates :position, presence: true
end
