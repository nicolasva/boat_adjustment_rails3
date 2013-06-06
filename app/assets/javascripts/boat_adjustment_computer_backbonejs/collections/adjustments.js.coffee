class App.Collections.Adjustments extends Backbone.Collection
  model: App.Adjustment

  url: ->
    App.routing({context_id: @context_id, firstname_id: @firstname_id, adjustment_type_id: @adjustment_type_id}, "adjustments")
