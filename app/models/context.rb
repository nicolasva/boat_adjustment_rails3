class Context < ActiveRecord::Base 
  attr_accessor :daytimes_attributes
  attr_accessible :daytimes_attributes
  attr_accessible :city
  attr_accessible :average_wind
  attr_accessible :wind_variation
  attr_accessible :wind_direction
  attr_accessible :sea_state
  attr_accessible :crew_ids
  attr_accessible :daytime_ids
  has_many :daytimes
  validates_presence_of :city
  validates_presence_of :average_wind
  validates_presence_of :wind_variation
  validates_presence_of :sea_state
  has_and_belongs_to_many :adjustement_types
  has_and_belongs_to_many :crews

  def save_context_with_daytimes
    if self.save
      save_daytimes(self.daytimes_attributes)
    end
    return self
  end

  def update_context_with_daytimes(attributes)
    self.update_attributes(:city => attributes[:city], :average_wind => attributes[:average_wind], :wind_variation => attributes[:wind_variation], :wind_direction => attributes[:wind_direction], :sea_state => attributes[:sea_state]) 
    if self.daytimes.first.nil?
      save_daytimes(attributes[:daytimes_attributes])
    else
      self.daytimes.first.update_attributes(attributes[:daytimes_attributes][0]) 
    end

    return self
  end

  private
  def save_daytimes(attributes)
    daytime = self.daytimes.new(attributes[0])
    daytime.save
  end
end
