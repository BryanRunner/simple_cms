class SimpleCms.Routers.ApplicationRouter extends Backbone.Router
  routes:
    ''                                 : 'index'
    'users/sign_up'                    : 'newUser'
    'subjects'                         : 'subjectsIndex'
    'subjects/new'                     : 'newSubject'
    'subject/:subject_id/edit'         : 'editSubject'
    'subject/:subject_id/pages'        : 'pagesIndex'
    'subject/:subject_id/page/:page_id': 'showPage'

  index: ->
    Backbone.trigger 'navChange', {type: "index"}
    welcomeView  = new SimpleCms.Views.Welcome()
    @swapView(welcomeView)

  newUser: ->
    Backbone.trigger 'navChange', {type: "index"}
    newUserView = new SimpleCms.Views.NewUser()
    @swapView(newUserView)

  subjectsIndex: ->
    Backbone.trigger 'navChange', {type: "index"}
    subjectsIndex = new SimpleCms.Views.SubjectsIndex(collection: SimpleCms.subjects)
    @swapView(subjectsIndex)

  showPage: (subject_id, page_id) ->
    Backbone.trigger 'navChange', {type: "page", subject_id: subject_id, page_id: page_id}
    subject = SimpleCms.subjects.get subject_id
    page = new SimpleCms.Views.Page(model: subject.pages.get(page_id))
    @swapView(page, subject_id, page_id)

  newSubject: ->
    newSubjectView = new SimpleCms.Views.NewSubject(collection: SimpleCms.subjects)
    @swapView(newSubjectView)

  editSubject: (subject_id) ->
    editSubjectView = new SimpleCms.Views.EditSubject(collection: SimpleCms.subjects, id: subject_id)
    @swapView(editSubjectView)

  swapView: (view) ->
    if @currentView
      $('#content .animate').velocity "transition.fadeOut", duration: 100, complete: =>
        @currentView.remove()
        @currentView = view
        SimpleCms.content.html(view.render().$el)
        $('#content .animate').velocity("transition.slideDownIn", stagger: 25, duration: 500)
    else
      @currentView = view
      SimpleCms.content.html(view.render().$el)
      $('#content .animate').velocity("transition.slideDownIn", stagger: 25, duration: 500)
