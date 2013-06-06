class App.Routers.Contexts extends Backbone.Router
  routes: 
    App.routing_yaml.routing_backbonejs.API.computer.contexts.routes

  initialize: ->
    alert("nicolas")
    @context = new App.Context()

  index: (firstname_id) ->
    alert("context lists")

  new: (firstname) ->
    @context.fetch
      success: (model, response) ->
        console.log model.toJSON()
        #@viewContextNew = new App.Views.Contexts.New({context: model})


