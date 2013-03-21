class Adjustment < ActiveRecord::Base
  attr_accessible :name, :value
  belongs_to :adjustment_type
end
