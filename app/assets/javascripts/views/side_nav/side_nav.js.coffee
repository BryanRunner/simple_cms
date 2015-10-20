class SimpleCms.Views.SideNav extends SimpleCms.Views.HelperMethods

  template: JST['side_nav/side_nav']

  initialize: ->
    @setElement('#sidebar-content')
    @listenTo Backbone, 'navCheck', @navStatus
    @listenTo Backbone, 'subjectChange', @updateSubjectNav
    @listenTo Backbone, 'pageChange', @updatePageNav
    @render()

  render: ->
    @$el.html(@template())
    @subjectNum = 0
    @collection.forEach (subject) =>
      @renderSubjectNav(subject)
      @subjectNum++
    @

  renderSubjectNav: (subject) =>
    subjectNav = new SimpleCms.Views.SubjectNav(model: subject)
    @$('.sidebar-nav').append(subjectNav.render().el)

  # color: ["#fff", "#64b189"]

  navStatus: ->
    if @subjectToggled
      Backbone.trigger 'subjectNavStatus', true
    else
      Backbone.trigger 'subjectNavStatus', false

  updateSubjectNav: (subjectId) =>
    subject = @$("#subject_#{subjectId}")
    height = @subjectNum * 41
    id = Number(subjectId)

    if @subjectToggled
      if @subjectToggled != id
        @subjectNavAnim(@prevSubject, height, "up")

        @subjectToggled = id
        @prevSubject = subject
        @subjectNavAnim(@prevSubject, height, "down")
    else
      @subjectToggled = id
      @prevSubject = subject
      @subjectNavAnim(@prevSubject, height, "down")

  updatePageNav: (pageId) =>
    page = @$("#page_#{pageId}")
    if @pageToggled
      @deactivateClass [@pageToggled], =>
        @pageToggled = page
        @activateClass([@pageToggled])
    else
      @pageToggled = page
      @activateClass([@pageToggled])
