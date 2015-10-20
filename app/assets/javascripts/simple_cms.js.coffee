window.SimpleCms =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: () ->
    new SimpleCms.Routers.ApplicationRouter(@InitialData)
    
$(document).ready ->
  SimpleCms.initialize()
  Backbone.history.start()
# if InitialData? and not _.isEmpty(InitialData)
#   SimpleCms.Collections.Subjects.reset InitialData
