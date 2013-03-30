class AdjustmentTypesSearchsController < ApplicationController
  respond_to :json

  def index
    @adjustment_types_searchs = Context.find(params[:contexts_search_id]).adjustment_types

    respond_with(@adjustment_types_searchs)
  end
end
