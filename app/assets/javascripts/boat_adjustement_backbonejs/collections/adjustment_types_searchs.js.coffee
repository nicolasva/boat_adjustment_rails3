class App.Collections.AdjustmentTypesSearchs extends Backbone.Collection
  model: App.AdjustmentTypesSearch

  url: ->
    App.routing({context_id: @context_id, firstname_id: @firstname_id, contexts_search_id: @contexts_search_id}, "adjustment_types_searchs")
