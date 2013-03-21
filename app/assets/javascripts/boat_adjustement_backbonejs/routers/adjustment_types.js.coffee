class App.Routers.AdjustmentTypes extends Backbone.Router
  routes:
    App.routing_yaml.routing_backbonejs.API.adjustment_types.routes

  initialize: ->
    @adjustmentTypes = new App.Collections.AdjustmentTypes()
    @adjustmentType = new App.AdjustmentType()
    @boat_types = new App.Collections.BoatTypes()
    @boat_type = new App.BoatType()

  index: (context_id, firstname_id) ->
    @adjustmentTypes.firstname_id = firstname_id
    @adjustmentTypes.context_id = context_id 
    @adjustmentTypes.fetch
      success: (collection, response) ->
        @viewAdjustmentTypesIndex = new App.Views.AdjustmentTypes.Index(adjustmentTypes: collection, context_id: context_id, firstname_id: firstname_id)

  new: (context_id, firstname_id) ->
    self = @
    @adjustmentType.firstname_id = firstname_id
    @adjustmentType.context_id = context_id
    @boat_types.fetch
      success: (collection, response) ->
        @viewAdjustmentTypesNew = new App.Views.AdjustmentTypes.New(adjustmentType: self.adjustmentType, boat_types: collection, boat_type: self.boat_type, context_id: context_id, firstname_id: firstname_id)

  edit: (context_id, firstname_id) ->
    self = @
    @adjustmentType.firstname_id = firstname_id
    @adjustmentType.context_id = context_id
    @adjustmentTypes.firstname_id = firstname_id
    @adjustmentTypes.context_id = context_id
    @adjustmentTypes.fetch
      success: (collection, response) ->
        @viewAdjustmentTypesEdit = new App.Views.AdjustmentTypes.Edit({adjustmentType: self.adjustmentType, adjustmentTypes: collection, context_id: context_id, firstname_id: firstname_id})

