class App.Views.AdjustmentTypes.New extends Backbone.View
  el: ".container"
  template: JST["boat_adjustement_backbonejs/templates/adjustment_types/new"]

  events:
    "click .class_add_adjustment_type" : "add_new_adjustment_type"

  initialize: (options) ->
    @adjustmentType = options.adjustmentType
    @context_id = options.context_id
    @firstname_id = options.firstname_id
    @boat_types = options.boat_types
    @boat_type = options.boat_type
    @render()

  render: ->
    $(@el).html(Haml.render(@template(), {locals: {context_id: @context_id, firstname_id: @firstname_id}}))

  add_new_adjustment_type: (event) ->
    @viewAddNewAdjustmentType = new App.Views.AdjustmentTypes.NewAdjustmentTypes({context_id: @context_id, firstname_id: @firstname_id, adjustmentType: @adjustmentType, boat_types: @boat_types, boat_type: @boat_type})

