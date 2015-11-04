window.SimpleCms =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: () ->
    @subjects     = new SimpleCms.Collections.Subjects(@InitialData.subjects)
    @router       = new SimpleCms.Routers.ApplicationRouter()
    @headerView   = new SimpleCms.Views.Header()
    @sideNav      = new SimpleCms.Views.SideNav(collection: @subjects)
    @content      = $('#content')

$(document).ready ->
  SimpleCms.initialize()
  Backbone.history.start()

# Rails CSRF Protection
$(document).ajaxSend (e, xhr, options) ->
  token = $("meta[name='csrf-token']").attr("content")
  xhr.setRequestHeader("X-CSRF-Token", token)
