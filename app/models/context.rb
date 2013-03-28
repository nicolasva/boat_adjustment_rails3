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
  has_and_belongs_to_many :adjustment_types
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

  def search_suggest_context(context_id)
    context = self.find(context_id)
    average_wind = context.average_wind
    wind_variation = context.wind_variation
    wind_direction = context.wind_direction
    hash_result_context_value = Hash.new
    hash_result_context_value = average_context(average_wind, wind_variation, wind_direction)
    self.where(:average_wind => hash_result_context_value[:average_wind_min]..hash_result_context_value[:average_wind_max], :wind_variation => hash_result_context_value[:wind_variation_min]..hash_result_context_value[:wind_variation_max], :wind_direction => hash_result_context_value[:wind_direction_min]..hash_result_context_value[:wind_direction_max])
  end

  private
  def save_daytimes(attributes)
    daytime = self.daytimes.new(attributes[0])
    daytime.save
  end

  def average_context(average_wind, wind_variation, wind_direction)
    hash_average_context = Hash.new
    min_value_average = 5
    hash_average_context[:average_wind_min] = average_wind - min_value_average
    hash_average_context[:wind_variation_min] = wind_variation - min_value_average
    hash_average_context[:wind_direction_min] = wind_direction - min_value_average

    hash_average_context[:average_wind_max] = average_wind + min_value_average
    hash_average_context[:wind_variation_max] = wind_variation + min_value_average
    hash_average_context[:wind_direction_max] = wind_direction + min_value_average 

    return hash_average_context
  end
end
