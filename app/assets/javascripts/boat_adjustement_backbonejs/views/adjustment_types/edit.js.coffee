class App.Views.AdjustmentTypes.Edit extends Backbone.View
  el: ".container"
  template: JST["boat_adjustement_backbonejs/templates/adjustment_types/edit"]

  template_suggest_adjustment: JST["boat_adjustement_backbonejs/templates/adjustment_types/suggest_adjustments"]

  template_add_new_adjustment_types: JST["boat_adjustement_backbonejs/templates/adjustment_types/add_new_adjustment_types"]

  template_adjustment_types_form_header_edit_adjustment_types: JST["boat_adjustement_backbonejs/templates/adjustment_types/_form_header_edit_adjustment_types"]

  template_no_adjustment_types: JST["boat_adjustement_backbonejs/templates/adjustment_types/no_adjustment_types"]
  
  vailabletemplate_add_adjustment: JST["boat_adjustement_backbonejs/templates/adjustments/new"]
  el_form_edit_adjustment_types: "#edit_adjustment_types"
  events: 
    "submit #edit_adjustment_types" : "update"
    "click .add_adjustment_to_adjustmenttype" : "create" 
    "click .delete_adjustment" : "delete"
    "click .delete_adjustmenttype" : "delete_adjustment_type"
    "click .suggest_adjustment" : "suggest_adjustment"

  initialize: (options) ->
    @city_id = options.city_id
    @contexts_searchs = options.contexts_searchs
    @adjustmentType = options.adjustmentType
    @adjustmentTypes = options.adjustmentTypes
    @boat_types = options.boat_types
    @boat_type = options.boat_type
    @context_id = options.context_id
    @firstname_id = options.firstname_id
    @adjustment_types_searchs = options.adjustment_types_searchs
    @render()

  render: ->
    self = @
    @ViewsCommonViewsHeadersLinkPanel = new App.Common.CommonViews.Headers.LinkPanel(template: @template_add_new_adjustment_types, context_id: @context_id, firstname_id: @firstname_id, adjustmentType: @adjustmentType, boat_types: @boat_types, boat_type: @boat_type, el_form_edit_adjustment_types: @el_form_edit_adjustment_types) unless _.isEqual($(".header").children().first().children().last().children().attr("class"), "class_add_adjustment_type")
    if _.isEmpty(@adjustmentTypes.toJSON())
      @contexts_searchs.fetch
        success: (collection, response) -> 
          unless _.isEmpty(collection.toJSON())
            $(self.el).html(Haml.render(self.template_suggest_adjustment())) 
          else
            $(self.el).html(Haml.render(self.template_no_adjustment_types()))

    else
      $(@el).html(Haml.render(@template_adjustment_types_form_header_edit_adjustment_types()))
      $(@el).children().first().children().first().html(Haml.render(@template(), {locals: {adjustmentTypes: @adjustmentTypes.toJSON()}}))

  delete_adjustment_type: (event) ->
    adjustment_type_id = parseInt($(event.target).parent().parent().parent().children().last().attr("id").split("_")[$(event.target).parent().parent().parent().children().last().attr("id").split("_").length-2])
    adjustmentType = new App.AdjustmentType(id: adjustment_type_id)
    adjustmentType.context_id = @context_id
    adjustmentType.firstname_id = @firstname_id
    adjustmentType.city_id = @city_id
    adjustmentType.destroy(
      success: (adjustmentType_response, response_adjustmentType) ->
        $(event.target).parent().parent().parent().remove()
      error: (adjustmentType_response, response_adjustmentType) ->
        console.log adjustmentType_response.toJSON()
        alert("Error")
    )
  update: (event) ->
    result_adjustment_save = true
    self = @
    data = $(@el_form_edit_adjustment_types).toJSON()
    array_adjustements_attributes =  data.adjustment_type.adjustments_attributes
    $.each(array_adjustements_attributes, (key, val) ->
      @adjustment = new App.Adjustment(id: val.id)
      @adjustment.context_id = self.context_id 
      @adjustment.firstname_id = self.firstname_id
      @adjustment.adjustment_type_id = val.adjustment_type_id
      @adjustment.city_id = self.city_id
      hash_data_adjustment = 
        adjustment:
          name: val.name
          value: val.value
          adjustment_type_id: val.adjustment_type_id
      @adjustment.save(hash_data_adjustment,
        error: (adjustment_response, response_adjustment) ->
          result_adjustment_save = false
          alert("Error")
          console.log adjustment_response.toJSON()
      )
    )
    window.location.hash = "#/cities/#{self.city_id}/contexts/#{self.context_id}/users/#{self.firstname_id}/adjustment_types" if result_adjustment_save 
    return false

  create: (event) ->
    self = @
    hash_data_adjustment = 
        adjustment:
          name: "Adjustment name"
          value: "Adjustment value"
          adjustment_type_id: parseInt($(event.target).parent().parent().parent().children().last().attr("id").split("_")[$(event.target).parent().parent().parent().children().last().attr("id").split("_").length-2])
    @adjustment = new App.Adjustment()
    @adjustment.context_id = self.context_id
    @adjustment.firstname_id = self.firstname_id
    @adjustment.adjustment_type_id = parseInt($(event.target).parent().parent().parent().children().last().attr("id").split("_")[$(event.target).parent().parent().parent().children().last().attr("id").split("_").length-2])
    @adjustment.city_id = self.city_id
    @adjustment.save(hash_data_adjustment,
      success: (adjustment_response, response_adjustment) ->
        el = $(event.target).parent().parent().parent().children().last()
        if $(event.target).parent().parent().parent().children().last().children().length == 0
          get_indice = parseInt($(event.target).parent().parent().parent().children().last().attr("id").split("_")[$(event.target).parent().parent().parent().children().last().attr("id").split("_").length-1]) 
        else
          get_indice = parseInt($(event.target).parent().parent().parent().children().last().children().last().children().first().attr("name").split("][")[1])
        $(el).append(Haml.render(self.template_add_adjustment(), {locals: {adjustment: adjustment_response.toJSON(), get_indice: ++get_indice}}))
      error: (adjustment_response, response_adjustment) ->
        console.log false
    )

  delete: (event) ->
    adjustment_id = $(event.target).attr('id').split("_")[$(event.target).attr('id').split("_").length - 1]
    @adjustment = new App.Adjustment(id: adjustment_id)
    @adjustment.context_id = self.context_id
    @adjustment.firstname_id = self.firstname_id
    @adjustment.adjustment_type_id = parseInt($(event.target).parent().parent().parent().parent().parent().children().first().attr("value"))
    @adjustment.city_id = city_id
    @adjustment.destroy
      success: (adjustment_response, response_adjustment) ->
        $(event.target).parent().parent().parent().parent().parent().children().first().parent().remove()
      error: (adjustment_response, response_adjustment) ->
        console.log adjustment_response
        alert("Error")
    
    #window.location.hash = "/#/contexts/#{@context_id}/users/#{@firstname_id}/adjustment_types/edit"
    
  suggest_adjustment: (event) ->
    self = @
    @contexts_searchs.fetch
      success: (collection, response) ->
        @viewSuggestAdjustment = new App.Views.ContextsSearchs.Index({contexts_searchs: collection, context_id: self.context_id, firstname_id: self.firstname_id})

