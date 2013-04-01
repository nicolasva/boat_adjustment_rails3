class App.Context extends Backbone.Model
  url: ->
    base = App.routing({}, "contexts")
    return base if @isNew()
    base + (if base.charAt(base.length - 1) is "/" then "" else "/") + @id

  suggest_calcul_adjustment: (context_origin) ->
    self = @
    @.fetch
      success: (model, response) ->
        #value context_search
        context_search = model.toJSON()
        context_origin.fetch
          success: (model_context_origin, response_context_origin) ->
            context_origin_result = model_context_origin.toJSON()
            self.suggest_adjustment(context_search, context_origin_result)

  suggest_adjustment: (context_search, context_origin) ->
    console.log context_search
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
      context:
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

  validate: (attributes) ->
    @errors = new Array()
    return @errors if @errors.length > 0
