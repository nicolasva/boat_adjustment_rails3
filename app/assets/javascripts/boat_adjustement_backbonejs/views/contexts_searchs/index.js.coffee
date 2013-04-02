class App.Views.ContextsSearchs.Index extends Backbone.View
  el: ".modal"
  el_modal_body: ".modal-body"
  template: JST["boat_adjustement_backbonejs/templates/contexts_searchs/index"]

  el_form_new_suggest_adjustment_type: "#new_suggest_adjustment_type"
  template_suggest_form_contexts_searchs: JST["boat_adjustement_backbonejs/templates/adjustment_types/new"]

  events:
    "click .context_search" : "context_search"
    "click .context_search_valid_adjustment_type" : "valid_adjustment_type_suggest"
    "submit #new_suggest_adjustment_type" : "create"

  initialize: (options) ->
    @context_id = options.context_id
    @firstname_id = options.firstname_id
    @contexts_searchs = options.contexts_searchs
    @adjustment = new App.Adjustment()
    @adjustment.context_id = @context_id
    @adjustment.firstname_id = @firstname_id
    @render()

  render: ->
    $(@el_modal_body).html(Haml.render(@template(), {locals: {contexts_searchs: @contexts_searchs.toJSON()}}))
    $(@el).modal('toggle')

  create: (event) ->
    #array_all_adjustment_type_id_contexts = new Array()
    self = @
    data = $(@el_form_new_suggest_adjustment_type).toJSON()
    $.each(data.adjustment_type.adjustments_attributes, (key, value) ->
      @context = new App.Context(id: self.context_id)
      hash_assoc_context_to_adjustment_type = 
        context:
          adjustment_type_ids: [value.adjustment_type_id]
      @context.save(hash_assoc_context_to_adjustment_type,
        success: (context, context_response) ->
          hash_adjustment = 
            adjustment:
              adjustment_type_id: value.adjustment_type_id
              name: value.name
              value: value.value
              #adjustment_type.save(hash_adjustment)
          self.adjustment.adjustment_type_id = value.adjustment_type_id 
          self.adjustment.save(hash_adjustment,
            success: (adjustment_result, adjustment_response) ->
              console.log true
            error: (adjustment_result_error, adjustment_response_error) ->
              console.log false
          )
        error: (context, context_reponse) ->
          console.log false
      )
    )
    return false
    

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
            $(self.el_modal_body).html(Haml.render(self.template_suggest_form_contexts_searchs(), {locals: {context: result_context_search_suggest}}))

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
