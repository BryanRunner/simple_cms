class SimpleCms.Views.SideNav extends SimpleCms.Views.HelperMethods

  template: JST['side_nav/side_nav']

  events:
    'click .subject-nav': 'clickSubjectNav'
    'click .page-nav'   : 'clickPageNav'

  initialize: ->
    @setElement("#sidebar-content")
    @render()

  render: ->
    @$el.html(@template())
    @collection.forEach (subject) =>
      @renderSubject(subject)
    @

  renderSubject: (subject) =>
    subjectNav = new SimpleCms.Views.SubjectNav(model: subject)
    @$('.sidebar-nav').append(subjectNav.render().el)

  clickSubjectNav: (event) ->
    clicked     = @$(event.target)
    target      = clicked.attr('href')
    activePages = @$('.pages-nav.active')
    subject     = @$('.subject-nav')

    event.preventDefault()
    if clicked.hasClass("active")
      @deactivateClass([clicked, activePages])
    else
      @deactivateClass([subject, activePages])
      @activateClass([clicked, target])

  clickPageNav: (event) ->
    clicked    = @$(event.target)
    page       = @$('.page-nav')
    activePage = @$('.page-nav.active')

    if clicked.hasClass("active") == false
      @activateClass([clicked])
    @deactivateClass([activePage])
