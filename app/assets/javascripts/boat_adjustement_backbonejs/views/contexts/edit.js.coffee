class App.Views.Contexts.Edit extends Backbone.View
  el: ".container"
  el_form_edit_context: "#edit_context"
  template: JST["boat_adjustement_backbonejs/templates/contexts/edit"]

  template_content_form: JST["boat_adjustement_backbonejs/templates/contexts/_form"]

  el_daytimes_day: ".context_daytimes_attributes_day"

  events: 
    "submit #edit_context" : "create"

  initialize: (options) ->
    @context = options.context
    @crews = options.crews
    @render()

  render: ->
    $(@el).html(Haml.render(@template()))
    $(@el).children().first().children().first().children().first().append(Haml.render(@template_content_form(), {locals: {context: @context.toJSON(), crews: @crews.toJSON(), page: "edit"}}))
    $(@el_daytimes_day).datepicker()

  create: (event) ->
    data = $(@el_form_edit_context).toJSON() 
    day = data["context"]["daytimes_attributes"][0]["day"].split("/").reverse().join("-")
    day = "#{day.scan(/^(.{1,}-).{1,}-.{1,}$/)[0][0]}#{day.scan(/^.{1,}-(.{1,}-.{1,})$/)[0][0].split("-").reverse().join("-")}"
    data["context"]["daytimes_attributes"][0]["day"] = day
    @context.save(data, 
      success: (context_response, response_context) ->
        window.location = "/contexts"
      error: (context_response, response_context) ->
        console.log context_response.toJSON()
        alert("Error")

    )
    return false
