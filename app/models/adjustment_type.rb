class AdjustmentType < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :name, :boat_type_id, :boat_type, :context_ids, :adjustments_attributes
  validates_presence_of :name
  validates_presence_of :boat_type_id
  belongs_to :boat_type
  has_many :adjustments
  has_and_belongs_to_many :contexts
  accepts_nested_attributes_for :adjustments
  accepts_nested_attributes_for :boat_type
end
