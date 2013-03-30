class ContextsSearchsController < ApplicationController
  respond_to :json

  def index
    @context = Context.search_suggest_context(params[:context_id])

    respond_with do |format|
      format.json {render json: @context.to_json(:include => {:adjustment_types => {:include => :adjustments}})}
    end
  end

end
