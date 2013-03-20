class App.Routers.Contexts extends Backbone.Router
  routes:
    App.routing_yaml.routing_backbonejs.API.contexts.routes

  initialize: ->
    @context = new App.Context()
    @crews = new App.Collections.Crews()

  new: (firstname_id) ->
    self = @
    @crews.firstname_id = firstname_id
    @crews.fetch
      success: (collection, response) ->
        @ViewContextNew = new App.Views.Contexts.New({context: self.context, crews: collection})
