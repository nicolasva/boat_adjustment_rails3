class App.Adjustment extends Backbone.Model
  url: ->
    base = App.routing({context_id: @context_id, firstname_id: @firstname_id, adjustment_type_id: @adjustment_type_id}, "adjustments")
    return base if @isNew()
    base + (if base.charAt(base.length - 1) is "/" then "" else "/") + @id
