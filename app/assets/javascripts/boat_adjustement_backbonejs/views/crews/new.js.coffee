class App.Views.Crews.New extends Backbone.View
  el: ".modal"
  el_modal_body: ".modal-body"
  template: JST["boat_adjustement_backbonejs/templates/crews/new"]
  el_form_new_crew: "#new_crew"
  el_select_crew_in_new_context: "#context_crew_ids"
  template_option_select_crew: JST["boat_adjustement_backbonejs/templates/crews/option_select_crew"]

  events: 
    "submit #new_crew" : "new"

  initialize: (options) ->
    @crew = options.crew
    @render()

  render: ->
    $(@el_modal_body).html(Haml.render(@template()))
    $(@el).modal('toggle')

  new: (event) ->
    self = @
    data = $(@el_form_new_crew).toJSON()
    @crew.save(data,
      success: (crew_response, response_crew) ->
        $(self.el_select_crew_in_new_context).append(Haml.render(self.template_option_select_crew(), {locals: {crew: crew_response.toJSON()}}))
        $(self.el).toggle('hide')
    )
    return false
