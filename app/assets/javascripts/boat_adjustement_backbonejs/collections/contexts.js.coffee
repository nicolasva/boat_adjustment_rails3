class App.Collections.Contexts extends Backbone.Collection
  model: App.Context

  url: ->
    unless _.isUndefined(@city_id)
      App.routing({city_id: @city_id}, "contexts")
    else
      App.routing({}, "contexts_bis")
