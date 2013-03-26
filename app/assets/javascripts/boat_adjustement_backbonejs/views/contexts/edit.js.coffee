class App.Views.Contexts.Edit extends Backbone.View
  el: ".container"
  template: JST["boat_adjustement_backbonejs/templates/contexts/edit"]

  template_content_form: JST["boat_adjustement_backbonejs/templates/contexts/_form"]

  el_daytimes_day: ".context_daytimes_attributes_day"

  initialize: (options) ->
    @context = options.context
    @crews = options.crews
    @render()

  render: ->
    console.log @context.toJSON().daytimes[0].day
    $(@el).html(Haml.render(@template()))
    $(@el).children().first().children().first().children().first().append(Haml.render(@template_content_form(), {locals: {context: @context.toJSON(), crews: @crews.toJSON(), page: "edit"}}))
    $(@el_daytimes_day).datepicker()
