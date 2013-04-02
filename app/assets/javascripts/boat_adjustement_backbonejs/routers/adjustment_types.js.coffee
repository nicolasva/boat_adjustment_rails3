class App.Routers.AdjustmentTypes extends Backbone.Router
  routes:
    App.routing_yaml.routing_backbonejs.API.adjustment_types.routes

  initialize: ->
    @adjustmentTypes = new App.Collections.AdjustmentTypes()
    @adjustmentType = new App.AdjustmentType()
    @boat_types = new App.Collections.BoatTypes()
    @boat_type = new App.BoatType()
    @contexts_searchs = new App.Collections.ContextsSearchs()

  index: (context_id, firstname_id) ->
    @adjustmentTypes.firstname_id = firstname_id
    @adjustmentTypes.context_id = context_id 
    @adjustmentTypes.fetch
      success: (collection, response) ->
        @viewAdjustmentTypesIndex = new App.Views.AdjustmentTypes.Index(adjustmentTypes: collection, context_id: context_id, firstname_id: firstname_id)

  edit: (context_id, firstname_id) ->
    self = @ 
    @contexts_searchs.context_id = context_id
    @contexts_searchs.firstname_id = firstname_id
    @adjustmentType.firstname_id = firstname_id
    @adjustmentType.context_id = context_id
    @adjustmentTypes.firstname_id = firstname_id
    @adjustmentTypes.context_id = context_id
    @adjustmentTypes.fetch
      success: (collection, response) ->
        self.boat_types.fetch
          success: (collection_boat_types, boat_types_response) ->
            @viewAdjustmentTypesEdit = new App.Views.AdjustmentTypes.Edit({adjustmentType: self.adjustmentType, adjustmentTypes: collection, boat_types: collection_boat_types, boat_type: self.boat_type, context_id: context_id, firstname_id: firstname_id, contexts_searchs: self.contexts_searchs, adjustment_types_searchs: self.adjustment_types_searchs})

