class App.Routers.Contexts extends Backbone.Router
  routes:
    App.routing_yaml.routing_backbonejs.API.contexts.routes

  initialize: ->
    $(".header").children().first().children().last().remove() if _.isEqual($(".header").children().first().children().length, 2) 
    @context = new App.Context()
    @crews = new App.Collections.Crews()
    @crew = new App.Crew()

  new: (firstname_id) ->
    self = @
    @crew.firstname_id = firstname_id
    @crews.firstname_id = firstname_id
    @crews.fetch
      success: (collection, response) ->
        @ViewContextNew = new App.Views.Contexts.New({context: self.context, crews: collection, crew: self.crew})
