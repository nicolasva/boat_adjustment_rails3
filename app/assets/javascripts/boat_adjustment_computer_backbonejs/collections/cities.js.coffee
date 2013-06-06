class App.Collections.Cities extends Backbone.Collection
  model: App.City

  url: ->
    App.routing({}, "cities")
