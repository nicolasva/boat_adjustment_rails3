class Adjustment < ActiveRecord::Base
  attr_accessible :name, :value, :adjustment_type_id
  belongs_to :adjustment_type
end
