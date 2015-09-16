class SimpleCms.Routers.Subjects extends Backbone.Router
  routes:
    '': 'index'

  initialize: (options) ->
    @subjects = new SimpleCms.Collections.Subjects(options.subjects)
    @headerView = new SimpleCms.Views.Header()

  index: ->
    subjectsIndex = new SimpleCms.Views.SubjectsIndex(collection: @subjects)
    $('#header').html(@headerView.render().el)
    $('#content').html(subjectsIndex.render().el)
