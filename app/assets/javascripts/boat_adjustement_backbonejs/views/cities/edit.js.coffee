class App.Views.Cities.Edit extends Backbone.View
  el: ".container"
  template_edit: JST["boat_adjustement_backbonejs/templates/cities/edit"]
  template: JST["boat_adjustement_backbonejs/templates/cities/_form"]

  el_form_edit_city: "#edit_city"

  initialize: (options) ->
    @city = options.city
    @render()

  events:
    "submit #edit_city" : "update"

  render: ->
    $(@el).html(Haml.render(@template_edit()))
    $(@el).children().first().children().first().children().first().append(Haml.render(@template(), {locals: {city: @city.toJSON(), page: "edit"}}))

  update: (event) ->
    data = $(@el_form_edit_city).toJSON()
    @city.save(data,
      success: (city_success, city_response_error) ->
        window.location = "/cities"
      error: (city_error, city_response_error) ->
        console.log city_error.toJSON()
        alert("Error")
    )
    return false
