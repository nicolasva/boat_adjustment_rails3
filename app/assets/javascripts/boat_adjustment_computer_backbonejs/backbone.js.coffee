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
    Contexts: {}
    Crews: {}
    Daytimes: {}
    Manufacturers: {}
    Sellers: {}
    Cities: {}
    ContextsSearchs: {}
  Routers: {}
  Libs: {}
  init: ->
    new App.Routers.Contexts()
    Backbone.history.start()
    return

App.routing_yaml = YAML.load('/assets/boat_adjustment_computer_backbonejs/routing/routing.yml')
App.routing = (hash = {}, route) ->
  $.each(App.routing_yaml.routing.API, (key, val) ->
    $.each(val, (key_route, value_route) ->
      if _.isEqual(key_route, route)
        route = value_route
        unless _.isEmpty(hash)
          $.each(hash, (key, val) ->
            route = route.replace(":"+key, val)
          )
        return false
    )
  )
  return route

$(document).ready ->
  App.init()
  return
