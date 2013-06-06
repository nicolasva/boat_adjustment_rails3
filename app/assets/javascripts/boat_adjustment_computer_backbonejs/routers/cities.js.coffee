class App.Routers.Cities extends Backbone.Router
  routes:
    App.routing_yaml.routing_backbonejs.API.computer.cities.routes

  initialize: ->
    @cities = new App.Collections.Cities()

  index: ->
    @cities.fetch
      success: (collection, response) ->
        @viewCitiesIndex = new App.Views.Cities.Index({cities: collection})
