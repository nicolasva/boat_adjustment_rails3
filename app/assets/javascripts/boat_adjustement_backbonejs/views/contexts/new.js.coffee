class App.Views.Contexts.New extends Backbone.View
  el: ".container"
  el_form_new_context: "#new_context"
  template: JST["boat_adjustement_backbonejs/templates/contexts/new"]

  events: 
    "submit #new_context" : "create"

  initialize: (options) ->
    @context = options.context
    @crews = options.crews
    @render()

  render: ->
    $(@el).html(Haml.render(@template(), {locals: {crews: @crews.toJSON()}}))

  create: (event) ->
    data = $(@el_form_new_context).toJSON()
    @context.save(data,
      success: (context_response, response_context) ->
        console.log context_response
      error: (context_response, response_context) ->
        alert("error")
    )
    return false
