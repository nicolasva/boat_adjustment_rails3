class Crew < ActiveRecord::Base
  attr_accessible :crew_weight
  belongs_to :user
  validates_presence_of :crew_weight
  has_and_belongs_to_many :contexts
end
