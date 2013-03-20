class AdjustmentTypesController < ApplicationController
  respond_to :json
  # GET /adjustment_types
  # GET /adjustment_types.json
  def index
    @adjustment_types = AdjustmentType.all

    respond_with(@adjustment_types)
  end

  # GET /adjustment_types/1
  # GET /adjustment_types/1.json
  def show
    @adjustment_type = AdjustmentType.find(params[:id])

    respond_with(@adjustment_type)
  end

  # GET /adjustment_types/new
  # GET /adjustment_types/new.json
  def new
    @adjustment_type = AdjustmentType.new

    respond_with(@adjustment_type)
  end

  # GET /adjustment_types/1/edit
  def edit
    @adjustment_type = AdjustmentType.find(params[:id])
    
    respond_with(@adjustment_type)
  end

  # POST /adjustment_types
  # POST /adjustment_types.json
  def create
    @adjustment_type = AdjustmentType.new(params[:adjustment_type])

    #respond_to do |format|
    #  if @adjustment_type.save
    #    format.html { redirect_to @adjustment_type, notice: 'Adjustment type was successfully created.' }
    #    format.json { render json: @adjustment_type, status: :created, location: @adjustment_type }
    #  else
    #    format.html { render action: "new" }
    #    format.json { render json: @adjustment_type.errors, status: :unprocessable_entity }
    #  end
    #end
    respond_with do |format|
      if @adjustment_type.save
        format.json {render json: @adjustment_type, status: :created}
      else
        format.json { render json: @adjustment_type.errors, status: :unprocessable_entity}
      end
    end
  end

  # PUT /adjustment_types/1
  # PUT /adjustment_types/1.json
  def update
    @adjustment_type = AdjustmentType.find(params[:id])

    respond_to do |format|
      if @adjustment_type.update_attributes(params[:adjustment_type])
        format.html { redirect_to @adjustment_type, notice: 'Adjustment type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @adjustment_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /adjustment_types/1
  # DELETE /adjustment_types/1.json
  def destroy
    @adjustment_type = AdjustmentType.find(params[:id])
    @adjustment_type.destroy

    respond_to do |format|
      format.html { redirect_to adjustment_types_url }
      format.json { head :no_content }
    end
  end
end
