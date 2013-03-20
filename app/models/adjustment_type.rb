class AdjustmentType < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :name, :boat_type_id, :boat_type
  validates_presence_of :name
  validates_presence_of :boat_type_id
  belongs_to :boat_type
  accepts_nested_attributes_for :boat_type
  alias_method :boat_type=, :boat_type_attributes=
end
