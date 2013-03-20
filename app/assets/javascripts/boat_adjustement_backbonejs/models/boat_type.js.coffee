class App.BoatType extends Backbone.Model
  url: ->
    base = App.routing({}, "boat_types")
    return base if @isNew()
    base + (if base.charAt(base.length - 1) is "/" then "" else "/") + @id
