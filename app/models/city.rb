class City < ActiveRecord::Base
  attr_accessible :name
  has_many :contexts
  accepts_nested_attributes_for :contexts
end
