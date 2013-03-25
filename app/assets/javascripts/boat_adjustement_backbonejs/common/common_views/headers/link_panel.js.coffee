class App.Common.CommonViews.Headers.LinkPanel extends Backbone.View
  el: ".header"

  initialize: (options) -> 
    @boat_types = options.boat_types unless _.isUndefined(options.boat_types)
    @el_form_edit_adjustment_types = options.el_form_edit_adjustment_types unless _.isUndefined(options.el_form_edit_adjustment_types)
    @boat_type = options.boat_type unless _.isUndefined(options.boat_type)
    @adjustmentType = options.adjustmentType unless _.isUndefined(options.adjustmentType)
    @context_id = options.context_id
    @firstname_id = options.firstname_id
    @template = options.template
    @render()

  events:
    "click .class_add_adjustment_type" : "add_new_adjustment_type" 

  render: ->
    if _.isUndefined(@boat_types)
      $(@el).children().first().append(Haml.render(@template(), {locals: {firstname_id: @firstname_id, context_id: @context_id}}))
    else
      $(@el).children().first().append(Haml.render(@template()))

  add_new_adjustment_type: (event) ->
    @viewAddNewAdjustmentType = new App.Views.AdjustmentTypes.NewAdjustmentTypes({context_id: @context_id, firstname_id: @firstname_id, adjustmentType: @adjustmentType, boat_types: @boat_types, boat_type: @boat_type, el_form_edit_adjustment_types: @el_form_edit_adjustment_types})
