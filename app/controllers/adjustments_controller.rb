class AdjustmentsController < ApplicationController
  respond_to :json
  # GET /adjustments
  # GET /adjustments.json
  def index
    @adjustments = Adjustment.all
    
    respond_with(@adjustments)
  end

  # GET /adjustments/1
  # GET /adjustments/1.json
  def show
    @adjustment = Adjustment.find(params[:id])

    respond_with(@adjustment)
  end

  # GET /adjustments/new
  # GET /adjustments/new.json
  def new
    @adjustment = Adjustment.new

    respond_with(@adjustment)
  end

  # GET /adjustments/1/edit
  def edit
    @adjustment = Adjustment.find(params[:id])
    respond_with(@adjustment)
  end

  # POST /adjustments
  # POST /adjustments.json
  def create
    @adjustment = Adjustment.new(params[:adjustment])

    respond_with do |format|
      if @adjustment.save
        format.json {render json: @adjustment, status: :created }
      else
        format.json {render json: @adjustment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /adjustments/1
  # PUT /adjustments/1.json
  def update
    @adjustment = Adjustment.find(params[:id])

    respond_with do |format|
      if @adjustment.update_attributes(params[:adjustment])
        format.json { render json: @adjustment }
      else
        format.json { render json: @adjustment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /adjustments/1
  # DELETE /adjustments/1.json
  def destroy
    @adjustment = Adjustment.find(params[:id])
    @adjustment.destroy

    respond_with(@adjustment)
  end
end
