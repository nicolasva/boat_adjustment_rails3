class App.Collections.BoatTypes extends Backbone.Collection
  model: App.BoatType

  url: ->
    App.routing({}, "boat_types")
