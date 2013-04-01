class ContextsController < ApplicationController
  respond_to :html, :json
  # GET /contexts
  # GET /contexts.json
  def index
    @contexts = Context.all

    respond_with(@contexts)  
  end

  # GET /contexts/1
  # GET /contexts/1.json
  def show
    @context = Context.find(params[:id])

    respond_with(@context) do |format|
      format.json {render json: @context.to_json(:include => [{:adjustment_types => {:include => :adjustments}}, :crews, :daytimes])}
    end
  end

  # GET /contexts/new
  # GET /contexts/new.json
  def new
    @context = Context.new
    respond_with(@context)
  end

  # GET /contexts/1/edit
  def edit
    @context = Context.find(params[:id])
    respond_with(@context)
  end

  # POST /contexts
  # POST /contexts.json
  def create
    @context = Context.new(params[:context])

    respond_with do |format|
      if @context.save_context_with_daytimes
        format.json { render json: @context, status: :created }
      else
        format.json { render json: @context.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /contexts/1
  # PUT /contexts/1.json
  def update
    @context = Context.find(params[:id])

    respond_with do |format|
      if @context.update_context_with_daytimes(params[:context])
        format.json { render json: @context}
      else
        format.json { render json: @context.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /contexts/1
  # DELETE /contexts/1.json
  def destroy
    @context = Context.find(params[:id])
    @context.destroy

    respond_with(@context)
  end
end
