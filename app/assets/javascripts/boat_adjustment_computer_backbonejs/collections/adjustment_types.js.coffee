class App.Collections.AdjustmentTypes extends Backbone.Collection
  model: App.AdjustmentType

  url: ->
    App.routing({context_id: @context_id, firstname_id: @firstname_id}, "adjustment_types")
