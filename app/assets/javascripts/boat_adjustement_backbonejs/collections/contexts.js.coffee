class App.Collections.Contexts extends Backbone.Collection
  model: App.Context

  url: ->
    App.routing({}, "contexts")
