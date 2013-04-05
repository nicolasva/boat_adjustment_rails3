class App.Context extends Backbone.Model
  result: ""
  
  url: ->
    base = App.routing({city_id: @city_id}, "contexts")
    return base if @isNew()
    base + (if base.charAt(base.length - 1) is "/" then "" else "/") + @id

  validate: (attributes) ->
    @errors = new Array()
    return @errors if @errors.length > 0
