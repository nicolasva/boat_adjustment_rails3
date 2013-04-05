class App.Views.Contexts.New extends Backbone.View
  el: ".container"
  el_form_new_context: "#new_context"
  template: JST["boat_adjustement_backbonejs/templates/contexts/new"]

  template_content_form: JST["boat_adjustement_backbonejs/templates/contexts/_form"]

  el_daytimes_day: ".context_daytimes_attributes_day"

  events: 
    "submit #new_context" : "create"
    "click .add_weight" : "add_weight"
    "click .class_add_city" : "add_city"

  initialize: (options) ->
    @city = options.city
    @cities = options.cities
    @context = options.context
    @crews = options.crews
    @crew = options.crew
    @render()

  render: ->
    $(@el).html(Haml.render(@template()))
    $(@el).children().first().children().first().children().first().append(Haml.render(@template_content_form(), {locals: {crews: @crews.toJSON(), cities: @cities.toJSON(), page: "new"}}))
    $(@el_daytimes_day).datepicker()

  add_city: (event) ->
    @view_add_new_city = new App.Views.Cities.New({city: @city})

  create: (event) ->
    data = $(@el_form_new_context).toJSON()
    day = data["context"]["daytimes_attributes"][0]["day"].split("/").reverse().join("-")
    day = "#{day.scan(/^(.{1,}-).{1,}-.{1,}$/)[0][0]}#{day.scan(/^.{1,}-(.{1,}-.{1,})$/)[0][0].split("-").reverse().join("-")}"
    data["context"]["daytimes_attributes"][0]["day"] = day
    @context.save(data,
      success: (context_response, response_context) ->
        window.location = "/contexts"
      error: (context_response, response_context) ->
        alert("error")
    )
    return false

  add_weight: (event) ->
    @viewCrewsNew = new App.Views.Crews.New(crew: @crew)
