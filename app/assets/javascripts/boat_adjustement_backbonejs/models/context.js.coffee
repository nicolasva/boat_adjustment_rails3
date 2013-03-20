class App.Context extends Backbone.Model
  url: ->
    base = App.routing({}, "contexts")
    return base if @isNew()
    base + (if base.charAt(base.length - 1) is "/" then "" else "/") + @id
    
  validate: (attributes) ->
    @errors = new Array()
    return @errors if @errors.length > 0
