class Daytime < ActiveRecord::Base
  attr_accessible :day, :context_id
  validates_presence_of :day
  validates_presence_of :context_id
  belongs_to :context
end
