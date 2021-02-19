class Match < ApplicationRecord
  belongs_to :player
  validates :type, presence: true
  validates :score, presence: true
  validates :result, presence: true
  validates :date, presence: true
  validates :surface, presence: true
  validates :notes, presence: true
  validates :partner, presence: false
end
