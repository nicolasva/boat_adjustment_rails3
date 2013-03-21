class App.Views.AdjustmentTypes.Edit extends Backbone.View
  el: ".container"
  template: JST["boat_adjustement_backbonejs/templates/adjustment_types/edit"]

  el_form_edit_adjustment_types: "#edit_adjustment_types"
  events: 
    "submit #edit_adjustment_types" : "create"

  initialize: (options) ->
    @adjustmentType = options.adjustmentType
    @adjustmentTypes = options.adjustmentTypes
    @context_id = options.context_id
    @firstname_id = options.firstname_id
    @render()

  render: ->
    $(@el).html(Haml.render(@template(), {locals: {adjustmentTypes: @adjustmentTypes.toJSON()}}))

  create: (event) ->
    data = $(@el_form_edit_adjustment_types).toJSON()
    console.log(data)
    @adjustmentType.save(data,
      success: (adjustmentType_response, response_adjustmentType) ->
        console.log true
      error: (adjustmentType_response, response_adjustmentType) ->
        alert("Error")
        console.log adjustmentType_response
    )
    return false

