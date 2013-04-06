class App.Routers.Cities extends Backbone.Router
  routes:
    App.routing_yaml.routing_backbonejs.API.cities.routes

  edit: (id) ->
    @city = new App.City(id: id)
    @city.fetch
      success: (model, response) ->
        @ViewCititesEdit = new App.Views.Cities.Edit(city: model)

  destroy: (id) ->
    @city = new App.City(id: id)
    @city.destroy
      success: (model, response) ->
        window.location = "/cities"
      error: (model, response) ->
        console.log model.toJSON()
        alert("Error")
