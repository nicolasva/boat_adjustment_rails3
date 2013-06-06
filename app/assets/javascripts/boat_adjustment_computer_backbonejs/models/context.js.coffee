class App.Context extends Backbone.Model
  result: ""

  url: ->
    unless _.isUndefined(@city_id)
      base = App.routing({city_id: @city_id, "contexts"})
    else
      base = App.routing({}, "contexts_bis")
    alert base
    return base if @isNew()
    base + (if base.charAt(base.length - 1) is "/" then "" else "/") + @id
