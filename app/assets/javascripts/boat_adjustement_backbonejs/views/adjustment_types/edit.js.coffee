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
    self = @
    data = $(@el_form_edit_adjustment_types).toJSON()
    array_adjustements_attributes =  data.adjustment_type.adjustments_attributes
    $.each(array_adjustements_attributes, (key, val) ->
      @adjustment = new App.Adjustment(id: val.id)
      @adjustment.context_id = self.context_id 
      @adjustment.firstname_id = self.firstname_id
      @adjustment.adjustment_type_id = val.adjustment_type_id
      hash_data_adjustment = 
        adjustment:
          name: val.name
          value: val.value
          adjustment_type_id: val.adjustment_type_id
      @adjustment.save(hash_data_adjustment,
        success: (adjustment_response, response_adjustment) ->
          console.log true
        error: (adjustment_response, response_adjustment) ->
          alert("Error")
          console.log adjustment_response.toJSON()
      )
    )
    return false

