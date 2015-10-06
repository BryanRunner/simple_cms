class SimpleCms.Routers.ApplicationRouter extends Backbone.Router
  routes:
    ''                                 : 'index'
    'subject/:subject_id'              : 'showSubject'
    'subject/:subject_id/page/:page_id': 'showPage'

  initialize: (options) ->
    @subjects     = new SimpleCms.Collections.Subjects(options.subjects)
    @pages        = new SimpleCms.Collections.Pages(_.flatten(@findPages(options.subjects)))
    headerView    = new SimpleCms.Views.Header()
    sideNav       = new SimpleCms.Views.SideNav(collection: @subjects)

  index: ->
    welcomeView  = new SimpleCms.Views.Welcome()

  showPage: (subject_id, page_id) ->
    page = new SimpleCms.Views.Page(collection: @pages, id: page_id)

  findPages: (subjects) ->
    _.map subjects, (subject) ->
      return subject.pages
