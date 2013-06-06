class App.Views.Contexts.New extends Backbone.View
  el: ".container"
  template: JST["boat_adjustment_computer_backbonejs/templates/contexts/new"]

  initialize: (options) ->
    @context = options.context
    @render()

  render: ->
    alert("nicolas")
