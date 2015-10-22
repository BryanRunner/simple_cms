class SimpleCms.Routers.ApplicationRouter extends Backbone.Router
  routes:
    ''                                 : 'index'
    'subjects'                         : 'subjectsIndex'
    'subject/:subject_id'              : 'showSubject'
    'subject/:subject_id/pages'        : 'pagesIndex'
    'subject/:subject_id/page/:page_id': 'showPage'

  initialize: (options) ->
    @subjects     = new SimpleCms.Collections.Subjects(options.subjects)
    @pages        = new SimpleCms.Collections.Pages(_.flatten(@findPages(options.subjects)))
    @headerView   = new SimpleCms.Views.Header()
    @sideNav      = new SimpleCms.Views.SideNav(collection: @subjects)
    @content      = $('#content')

  index: ->
    welcomeView  = new SimpleCms.Views.Welcome()
    @swapView(welcomeView)

  showPage: (subject_id, page_id) ->
    page = new SimpleCms.Views.Page(collection: @pages, id: page_id)
    @swapView(page, subject_id, page_id)

  swapView: (view) ->
    router = @
    if @currentView
      $('#content .animate').velocity "transition.fadeOut", duration: 100, complete: ->
        router.currentView.remove()
        router.currentView = view
        router.content.html(view.render().$el)
        $('#content .animate').velocity("transition.slideDownIn", stagger: 25, duration: 300)
    else
      router.currentView = view
      router.content.html(view.render().$el)
      $('#content .animate').velocity("transition.slideDownIn", stagger: 25, duration: 300)

  findPages: (subjects) ->
    _.map subjects, (subject) ->
      return subject.pages
