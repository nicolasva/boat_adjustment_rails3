class Computer::CitiesController < ApplicationController
  respond_to :html, :json

  def index
    @cities = City.joins(:contexts).order("contexts.created_at DESC").group(:id)
    respond_with(@cities)
  end

end
