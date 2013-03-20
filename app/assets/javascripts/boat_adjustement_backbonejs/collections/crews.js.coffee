class App.Collections.Crews extends Backbone.Collection
  model: App.Crew

  url: ->
    unless _.isUndefined(@context_id)
      App.routing({firstname_id: @firstname_id, context_id: @context_id}, "crews")
    else
      App.routing({firstname_id: @firstname_id}, "crews_bis")
