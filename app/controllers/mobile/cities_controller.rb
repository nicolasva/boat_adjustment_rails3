class Mobile::CitiesController < ApplicationController
  respond_to :html, :json
  
  def index
    @cities = City.joins(:contexts => :crews).where(:crews => {:user_id => current_user.id}).group(:id).all

    if !request.referer.scan(/^.{1,}(users).{1,}$/)[0].nil?
      user_agent?(request.env["HTTP_USER_AGENT"])
    else
      respond_with(@cities)
    end
  end

  # GET /cities/1
  # GET /cities/1.json
  def show
    @city = City.find(params[:id])

    respond_with(@city)
  end

  # GET /cities/new
  # GET /cities/new.json
  def new
    @city = City.new

    respond_with(@city)
  end

  # GET /cities/1/edit
  def edit
    @city = City.find(params[:id])
  
    respond_with(@city)
  end

  # POST /cities
  # POST /cities.json
  def create
    @city = City.new(params[:city])

    respond_with do |format|
      if @city.save
        format.json { render json: @city, status: :created }
      else
        format.json { render json: @city.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cities/1
  # PUT /cities/1.json
  def update
    @city = City.find(params[:id])

    respond_with do |format|
      if @city.update_attributes(params[:city])
        format.json { render json: @city }
      else
        format.json { render json: @city.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cities/1
  # DELETE /cities/1.json
  def destroy
    @city = City.find(params[:id])
    @city.destroy

    respond_with(@city)
  end

  private
  def user_agent?(http_user_agent)
     if http_user_agent.scan(/^.{1,}(Mobile).{1,}$/)[0].nil? 
       redirect_to :controller => "/computer/cities", :action => "index"
     else
       respond_with(@city)
     end
  end
end
