class Match < ApplicationRecord
  validates_presence_of :type
  validates_presence_of :score
  validates_presence_of :result
  validates_presence_of :date
  validates_presence_of :surface

  belongs_to :player
end
