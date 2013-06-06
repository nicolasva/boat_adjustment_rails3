class App.Routers.Contexts extends Backbone.Router
  routes:
    App.routing_yaml.routing_backbonejs.API.mobile.contexts.routes

  initialize: ->
    $(".header").children().first().children().last().remove() if _.isEqual($(".header").children().first().children().length, 2) 
    @context = new App.Context()
    @contexts = new App.Collections.Contexts()
    @cities = new App.Collections.Cities()
    @city = new App.City()
    @crews = new App.Collections.Crews()
    @crew = new App.Crew()

  index: (firstname_id, city_id) ->
    @contexts.city_id = city_id
    @contexts.fetch
      success: (collection_contexts, contexts_response) ->
        @ViewContextsIndex = new App.Views.Contexts.Index({contexts: collection_contexts, firstname_id: firstname_id})
      
  new: (firstname_id) ->
    self = @
    @crew.firstname_id = firstname_id
    @crews.firstname_id = firstname_id
    @cities.fetch
      success: (collection_cities, cities_response) ->
        self.crews.fetch
          success: (collection, response) ->
            @ViewContextNew = new App.Views.Contexts.New({context: self.context, crews: collection, crew: self.crew, city: self.city, cities: collection_cities})

  edit: (city_id, firstname_id, id) ->
    self = @
    @crews.firstname_id = firstname_id
    @context = new App.Context(id: id)
    @context.city_id = city_id
    @context.fetch
      success: (model, response) ->
        self.crews.fetch
          success: (collection, response_crew) ->
            self.cities.fetch
              success: (cities, response_cities) ->
                @ViewContextEdit = new App.Views.Contexts.Edit({context: model, crews: collection, city: self.city, cities: cities})

  destroy: (city_id, id) ->
    @context = new App.Context(id: id)
    @context.city_id = city_id
    @context.destroy
      success: (model, response) ->
        window.location.hash = "/#/city/"+city_id+"/contexts"
      error: (model, response) ->
        console.log model.toJSON()
        alert("Error")
