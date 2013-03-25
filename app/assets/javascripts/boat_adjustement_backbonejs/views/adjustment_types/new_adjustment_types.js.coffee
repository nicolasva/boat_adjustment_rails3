class App.Views.AdjustmentTypes.NewAdjustmentTypes extends Backbone.View
  el: ".modal-body"
  el_modal_box: ".modal"
  template: JST["boat_adjustement_backbonejs/templates/adjustment_types/new_adjustment_types"]

  el_new_boat: ".add_new_boat"
  template_new_boat: JST["boat_adjustement_backbonejs/templates/adjustment_types/add_new_boat_model"]

  template_new_adjustment_type_append: JST["boat_adjustement_backbonejs/templates/adjustment_types/form_new_adjustment_type_append"]
  el_form_new_adjustment_types: "#new_adjustment_types"
  events: 
    "click .class_add_new_boat" : "add_new_boat_model"
    "submit #new_adjustment_types" : "create"

  initialize: (options) ->
    @el_form_edit_adjustment_types = options.el_form_edit_adjustment_types
    @context_id = options.context_id
    @firstname_id = options.firstname_id
    @adjustmentType = options.adjustmentType
    @boat_type = options.boat_type
    @boat_types = options.boat_types
    @render()

  render: ->
    $(@el_modal_box).modal('toggle')
    $(@el).html(Haml.render(@template(), {locals: {context_id: @context_id, firstname_id: @firstname_id, boat_types: @boat_types.toJSON()}}))

  create: (event) ->
    self = @
    data = $(@el_form_new_adjustment_types).toJSON()
    unless _.isUndefined(data["boat_type"])
      data_boat_type = 
        boat_type:
          length: data.boat_type.length
          model: data.boat_type.model
          serial_number_jib_sail: data.boat_type.serial_number_jib_sail
          serial_number_sail: data.boat_type.serial_number_sail
          serial_number_spineaker: data.boat_type.serial_number_spineaker
          width: data.boat_type.width

      @boat_type.save(data_boat_type,
        success: (boat_type_response, response_boat_type) ->
          data_adjustment_type = 
            adjustment_type:
              name: data.adjustment_type.name
              boat_type_id: boat_type_response.toJSON().id
          self.save_adjustment_type(data_adjustment_type)
        error: (boat_type_response, response_boat_type) ->
          console.log boat_type_response.toJSON()
          alert("Error")
      )
    else
      self.save_adjustment_type(data)
    return false

  save_adjustment_type: (data_adjustment_type) ->
    self = @
    @adjustmentType.save(data_adjustment_type,
      success: (adjustment_type_response, response_adjustment_type) ->
        $(self.el_form_edit_adjustment_types).children().first().append(Haml.render(self.template_new_adjustment_type_append(), {locals: {adjustmentType: adjustment_type_response.toJSON()}}))
        $(self.el_modal_box).modal('hide')
      error: (adjustment_type_response, response_adjustment_type) ->
        alert("Error")
        console.log adjustment_type_response.toJSON()
    )

  add_new_boat_model: (event) ->
    $(@el_new_boat).html(Haml.render(@template_new_boat()))
