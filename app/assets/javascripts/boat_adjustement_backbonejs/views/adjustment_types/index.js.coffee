class App.Views.AdjustmentTypes.Index extends Backbone.View
  el: ".container"
  template: JST["boat_adjustement_backbonejs/templates/adjustment_types/index"]

  initialize: (options) ->
    @adjustmentTypes = options.adjustmentTypes
    @context_id = options.context_id
    @firstname_id = options.firstname_id
    @render()

  render: ->
    $(@el).html(Haml.render(@template(), {locals: {adjustmentTypes: @adjustmentTypes.toJSON(), firstname_id: @firstname_id, context_id: @context_id}}))

