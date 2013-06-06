class App.Collections.ContextsSearchs extends Backbone.Collection
  model: App.ContextsSearch

  url: ->
    App.routing({context_id: @context_id, firstname_id: @firstname_id}, "contexts_searchs")
