class SimpleCms.Routers.Subjects extends Backbone.Router
  routes:
    '': 'index'

  initialize: (options) ->
    @subjects = new SimpleCms.Collections.Subjects(options.subjects)
    @headerView = new SimpleCms.Views.Header()
    @welcomeView = new SimpleCms.Views.Welcome()

  index: ->
    subjectsIndex = new SimpleCms.Views.SubjectsIndex(collection: @subjects)
    $('#header').html(@headerView.render().el)
    $('#content').html(@welcomeView.render().el)
    $('#sidebar-wrapper').append(subjectsIndex.render().el)
