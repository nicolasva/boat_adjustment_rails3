class App.Views.AdjustmentTypes.Index extends Backbone.View
  el: ".container"
  template: JST["boat_adjustement_backbonejs/templates/adjustment_types/index"]

  template_link_edit_adjustmentTypes: JST["boat_adjustement_backbonejs/templates/adjustment_types/link_edit_adjustment_types"]
 
  initialize: (options) ->
    @adjustmentTypes = options.adjustmentTypes
    @context_id = options.context_id
    @firstname_id = options.firstname_id
    @render()

  render: ->
    @ViewsCommonViewsHeadersLinkPanel = new App.Common.CommonViews.Headers.LinkPanel(context_id: @context_id, firstname_id: @firstname_id, template: @template_link_edit_adjustmentTypes) unless _.isEqual($(".header").children().first().children().last().children().attr("href"), "/#/contexts/#{@context_id}/users/#{@firstname_id}/adjustment_types/edit") 
    $(@el).html(Haml.render(@template(), {locals: {adjustmentTypes: @adjustmentTypes.toJSON(), firstname_id: @firstname_id, context_id: @context_id}}))

