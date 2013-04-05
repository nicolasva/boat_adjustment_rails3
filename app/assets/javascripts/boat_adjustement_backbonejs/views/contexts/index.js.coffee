class App.Views.Contexts.Index extends Backbone.View
  el: ".container"
  template: JST["boat_adjustement_backbonejs/templates/contexts/index"]

  initialize: (options) ->
    @firstname_id = options.firstname_id
    @contexts = options.contexts
    @render()

  render: ->
    console.log @contexts.toJSON()[0]
    $(@el).html(Haml.render(@template(), {locals: {contexts: @contexts.toJSON(), firstname_id: @firstname_id}}))
