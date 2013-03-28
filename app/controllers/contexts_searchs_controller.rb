class ContextsSearchsController < ApplicationController
  respond_to :json

  def index
    @context = Context.search_suggest_context(params[:context_id])  
  end
end
