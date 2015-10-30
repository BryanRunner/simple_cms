class SimpleCms.Views.SideNav extends SimpleCms.Views.HelperMethods

  template: JST['side_nav/side_nav']

  initialize: ->
    @setElement('#sidebar-content')
    @listenTo Backbone, 'navCheck', @navStatus
    @listenTo Backbone, 'pageChange', @updatePageNav
    @listenTo Backbone, 'subjectCreated', @renderSubjectNav
    @listenTo Backbone, 'subjectDestroyed', @destroySubjectNav
    @render()

  events: ->
    'click .subject-nav' :'announceSubject'

  render: ->
    @$el.html(@template(subjects: @collection))
    # @subjectNum = []
    # @collection.forEach (subject) =>
    #   @renderSubjectNav(subject)
    @

  renderSubjectNav: (subject) =>
    subjectNav = new SimpleCms.Views.SubjectNav(model: subject)
    @$('.sidebar-nav').append(subjectNav.render().el)

  destroySubjectNav: (subjectId) =>
    $("#subject_#{subjectId}").closest("li").remove()

  # color: ["#fff", "#64b189"]

  announceSubject: (event) ->
    event.preventDefault()
    target = $(event.currentTarget).attr('href')
    id = target.split("_").pop()
    @updateSubjectNav(id)
    # Backbone.trigger('subjectChange', ["#{@model.get('id')}"])


  navStatus: ->
    if @subjectToggled
      Backbone.trigger 'subjectNavStatus', true
    else
      Backbone.trigger 'subjectNavStatus', false

  updateSubjectNav: (subjectId) =>
    id = Number(subjectId)
    subject = @$("#subject_#{subjectId}")
    subjectModel = @collection.get(id).attributes.numberOfPages
    height = subjectModel * 41

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
