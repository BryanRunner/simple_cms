class SimpleCms.Routers.Subjects extends Backbone.Router
  routes:
    '': 'index'
    'subject/:subject_id': 'showSubject'
    'subject/:subject_id/page/:page_id': 'showPage'

  initialize: (options) ->
    @subjects     = new SimpleCms.Collections.Subjects(options.subjects)
    @pages        = new SimpleCms.Collections.Pages(_.flatten(@findPages(options.subjects)))
    @headerView   = new SimpleCms.Views.Header()
    @welcomeView  = new SimpleCms.Views.Welcome()
    subjectsIndex = new SimpleCms.Views.SubjectsIndex(collection: @subjects)

    $('#sidebar-wrapper').append(subjectsIndex.render().el)

  index: ->
    $('#content').html(@welcomeView.render().el)

  showPage: (subject_id, page_id) ->
    pageContent = new SimpleCms.Views.PageContent(collection: @pages, id: page_id)
    $('#content').html(pageContent.render().el)

  findPages: (subjects) ->
    _.map subjects, (subject) ->
      return subject.pages
