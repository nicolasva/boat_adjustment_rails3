class Mobile::DaytimesController < ApplicationController
  # GET /daytimes
  # GET /daytimes.json
  def index
    @daytimes = Daytime.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @daytimes }
    end
  end

  # GET /daytimes/1
  # GET /daytimes/1.json
  def show
    @daytime = Daytime.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @daytime }
    end
  end

  # GET /daytimes/new
  # GET /daytimes/new.json
  def new
    @daytime = Daytime.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @daytime }
    end
  end

  # GET /daytimes/1/edit
  def edit
    @daytime = Daytime.find(params[:id])
  end

  # POST /daytimes
  # POST /daytimes.json
  def create
    @daytime = Daytime.new(params[:daytime])

    respond_to do |format|
      if @daytime.save
        format.html { redirect_to @daytime, notice: 'Daytime was successfully created.' }
        format.json { render json: @daytime, status: :created, location: @daytime }
      else
        format.html { render action: "new" }
        format.json { render json: @daytime.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /daytimes/1
  # PUT /daytimes/1.json
  def update
    @daytime = Daytime.find(params[:id])

    respond_to do |format|
      if @daytime.update_attributes(params[:daytime])
        format.html { redirect_to @daytime, notice: 'Daytime was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @daytime.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /daytimes/1
  # DELETE /daytimes/1.json
  def destroy
    @daytime = Daytime.find(params[:id])
    @daytime.destroy

    respond_to do |format|
      format.html { redirect_to daytimes_url }
      format.json { head :no_content }
    end
  end
end
