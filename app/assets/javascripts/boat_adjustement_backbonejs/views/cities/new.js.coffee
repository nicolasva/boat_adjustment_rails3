class App.Views.Cities.New extends Backbone.View
  el: ".modal"
  el_modal_body: ".modal-body"

  template: JST["boat_adjustement_backbonejs/templates/cities/new"]

  template_form_add_select_option_cities: JST["boat_adjustement_backbonejs/templates/cities/_form_add_select_option_cities"]

  el_form_add_new_city: "#add_new_city"

  el_select_city: "#context_city_id"

  events: 
    "submit #add_new_city" : "create"

  initialize: (options) ->
    @city = options.city
    @render()

  render: ->
    self = @
    $(@el_modal_body).html(Haml.render(@template()))
    $(@el).modal('toggle')

  create: (event) ->
    self = @
    data = $(@el_form_add_new_city).toJSON()
    @city.save(data,
      success: (city, city_response) ->
        $(self.el_select_city).append(Haml.render(self.template_form_add_select_option_cities(), {locals: {city: city.toJSON()}}))
        $(self.el).toggle('hide')
      error: (city, city_response) ->
        console.log city.toJSON()
        alert("Error")
    )
    return false

