class Context < ActiveRecord::Base
  attr_accessible :city
  attr_accessible :average_wind
  attr_accessible :wind_variation
  attr_accessible :wind_direction
  attr_accessible :sea_state
  attr_accessible :crew_ids
  validates_presence_of :city
  validates_presence_of :average_wind
  validates_presence_of :wind_variation
  validates_presence_of :sea_state
  has_and_belongs_to_many :adjustement_types
  has_and_belongs_to_many :crews
end
