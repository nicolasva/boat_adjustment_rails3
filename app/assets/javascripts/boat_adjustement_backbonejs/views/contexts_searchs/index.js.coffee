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
    self = @
    contexts_search_id = $(event.target).parent().parent().attr("id").split("_")[$(event.target).parent().parent().attr("id").split("_").length - 1]
    context_origin = new App.Context(id: @context_id)
    context_search = new App.Context(id: contexts_search_id)
    context_search.fetch
      success: (model, response) ->
        context_search = model.toJSON()
        context_origin.fetch
          success: (model_context_origin, response_context_origin) ->
            context_origin_result = model_context_origin.toJSON()
            result_context_search_suggest = self.suggest_adjustment(context_search, context_origin_result)

  suggest_adjustment: (context_search, context_origin) ->
    array_result_adjustment_types = new Array() 
    average_wind_context_search = context_search.average_wind
    wind_direction_context_search = context_search.wind_direction
    wind_variation_context_search = context_search.wind_variation
    average_value_context_search = (parseFloat(average_wind_context_search) + parseFloat(wind_direction_context_search) + parseFloat(wind_variation_context_search)) / 3
    
    average_wind_context_origin = context_origin.average_wind
    wind_direction_context_origin = context_origin.wind_direction
    wind_variation_context_origin = context_origin.wind_variation

    average_value_context_origin = (parseFloat(average_wind_context_origin) + parseFloat(wind_direction_context_origin) + parseFloat(wind_variation_context_origin)) / 3

    $.each(context_search.adjustment_types, (key, value) ->
      array_adjustments = new Array()
      $.each(value.adjustments, (key_adjustment, value_adjustment) ->
        value_adjustment_search = value_adjustment.value
        value_adjustment_origin = ((value_adjustment_search * average_value_context_origin) / average_value_context_search)
        hash_adjustment_value = 
          adjustment_type_id: value_adjustment.adjustment_type_id
          name: value_adjustment.name
          value: value_adjustment_origin
        array_adjustments.push(hash_adjustment_value)
      ) 
      hash_adjustments =
        adjustments: array_adjustments
        boat_type_id: value.boat_type_id
        name: value.name
        id: value.id
      array_result_adjustment_types.push(hash_adjustments)
    )
    hash_result_context =
      id: context_origin.id
      adjustment_types: array_result_adjustment_types 
      average_wind: context_origin.average_wind
      city: context_origin.city
      created_at: context_origin.created_at
      crews: context_origin.crews
      daytimes: context_origin.daytimes
      id: context_origin.id
      sea_state: context_origin.sea_state
      updated_at: context_origin.updated_at
      wind_direction: context_origin.wind_direction
      wind_variation: context_origin.wind_variation

    return hash_result_context
