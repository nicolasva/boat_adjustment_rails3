class BoatType < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :model, :length, :width, :serial_number_sail, :serial_number_jib_sail, :serial_number_spineaker
  validates_presence_of :model
  validates_presence_of :length
  validates_presence_of :width
  validates_presence_of :serial_number_sail
  validates_presence_of :serial_number_jib_sail
  validates_presence_of :serial_number_spineaker
  has_many :adjustment_types
  accepts_nested_attributes_for :adjustment_types
end
