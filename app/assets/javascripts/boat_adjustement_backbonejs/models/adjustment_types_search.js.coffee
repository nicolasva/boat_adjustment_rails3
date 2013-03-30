class App.AdjustmentTypesSearch extends Backbone.Model
  url: ->
    base = App.routing({context_id: @context_id, firstname_id: @firstname_id, contexts_search_id: @contexts_search_id}, "adjustment_types_searchs")
    return base if @isNew()
    base + (if base.charAt(base.length - 1) is "/" then "" else "/") + @id

  validate: (attributes) ->
    @errors = new Array()
    return @errors if @errors.length > 0
