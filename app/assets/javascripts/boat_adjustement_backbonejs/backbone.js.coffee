#= require_self
#= require_tree ./templates
#= require_tree ./common/common_templates
#= require_tree ./models
#= require_tree ./collections
#= require_tree ./views
#= require_tree ./common/common_views
#= require_tree ./libs
#= require_tree ./routers

@App = 
  Models: {}
  Collections: {}
  Common: {} =
    CommonViews: {} =
      Notice: {}
  Views: {} = 
    BoatTypes: {}
    Contexts: {}
    Adjustments: {}
    AdjustmentTypes: {}
    BoatTypes: {}
    Contexts: {}
    Crews: {}
    Daytimes: {}
    Manufacturers: {}
    Sellers: {}
  Routers: {}
  Libs: {}
  init: ->
    new App.Routers.Contexts()
    new App.Routers.AdjustmentTypes()
    Backbone.history.start()
    return

App.routing_yaml = YAML.load('assets/boat_adjustement_backbonejs/routing/routing.yml')
App.routing = (hash = {}, route) ->
  $.each(App.routing_yaml.routing.API, (key, val) ->
    if _.isEqual(key, route)
      route = val
      unless _.isEmpty(hash)
        $.each(hash, (key, val) ->
          route = route.replace(":"+key, val)
        )
      return false
  )

  return route

$(document).ready ->
  App.init()
  return
