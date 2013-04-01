class App.Views.ContextsSearchs.Index extends Backbone.View
  el: ".modal"
  el_modal_body: ".modal-body"
  template: JST["boat_adjustement_backbonejs/templates/contexts_searchs/index"]

  events:
    "click .context_search" : "context_search"
    "click .context_search_valid_adjustment_type" : "valid_adjustment_type_suggest"
  initialize: (options) ->
    @context_id = options.context_id
    @firstname_id = options.firstname_id
    @contexts_searchs = options.contexts_searchs
    @render()

  render: ->
    $(@el_modal_body).html(Haml.render(@template(), {locals: {contexts_searchs: @contexts_searchs.toJSON()}}))
    $(@el).modal('toggle')

  context_search: (event) ->
    hidden_contexts_searchs_adjustments_types = 1
    $(".class_context_search").children().first().children().each (key, value) ->
      if $(value).children().first() == $(event.target)
        hidden_contexts_searchs_adjustments_types = hidden_contexts_searchs_adjustments_types * 0
      else
        $(value).children().first().children().each (key_span, value_span) ->
          hidden_contexts_searchs_adjustments_types = hidden_contexts_searchs_adjustments_types * 0 if $(value_span) == $(event.target)

      if hidden_contexts_searchs_adjustments_types == 0
        $(value).children().last() 
        hidden_contexts_searchs_adjustments_types = 1

    if $(event.target).attr("class") == "span2"
      $(event.target).parent().parent().children().last().toggle("slow")
    else
      $(event.target).parent().children().last().toggle("slow")

  valid_adjustment_type_suggest: (event) ->
    contexts_search_id = $(event.target).parent().parent().attr("id").split("_")[$(event.target).parent().parent().attr("id").split("_").length - 1]
    context_origin = new App.Context(id: @context_id)
    context_search = new App.Context(id: contexts_search_id)
    result_context_search = context_search.suggest_calcul_adjustment(context_origin)
