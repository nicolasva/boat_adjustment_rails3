class App.Collections.Crews extends Backbone.Collection
  model: App.Crew

  url: ->
    App.routing({firstname_id: @firstname_id}, "crews")
