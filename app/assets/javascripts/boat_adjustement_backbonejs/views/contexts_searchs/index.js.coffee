class App.Views.ContextsSearchs.Index extends Backbone.View
  el: ".modal"
  el_modal_body: ".modal-body"
  template: JST["boat_adjustement_backbonejs/templates/contexts_searchs/index"]

  events:
    "click .context_search" : "context_search"

  initialize: (options) ->
    @contexts_searchs = options.contexts_searchs
    @render()

  render: ->
    $(@el_modal_body).html(Haml.render(@template(), {locals: {contexts_searchs: @contexts_searchs.toJSON()}}))
    $(@el).modal('toggle')

  context_search: (event) ->
    if $(event.target).attr("class") == "span2"
      $(event.target).parent().parent().children().last().toggle("slow")
    else
      $(event.target).parent().children().last().toggle("slow")
