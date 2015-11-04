class SimpleCms.Views.SideNav extends SimpleCms.Views.HelperMethods

  template: JST['side_nav/side_nav']

  initialize: ->
    @setElement('#sidebar-content')
    @listenTo Backbone, 'navChange', @activeNavigation
    @listenTo Backbone, 'subjectCreated', @renderSubjectNav
    @listenTo Backbone, 'subjectDestroyed', @destroySubjectNav
    @render()

  events: ->
    'click .subject-nav' :'toggleSubject'

  render: ->
    @$el.html(@template(subjects: @collection))
    @

  toggleSubject: (event) ->
    @subjectToggled = true
    subjectNav      = $(event.currentTarget).attr('href')
    id              = subjectNav.split("_").pop()
    event.preventDefault()
    @activeNavigation({type: "subject", nav: subjectNav, id: id})

  activeNavigation: (options) ->
    switch options.type
      when "subject"
        @navExpandCollapse({nav: options.nav, id: options.id})
      when "page"
        if @subjectToggled != true
          subjectNav      = "#pages_#{options.subject_id}"
          @subjectToggled = true
          @navExpandCollapse({nav: subjectNav, id: options.subject_id})
          @updatePageNav({page_id: options.page_id})
        else
          @updatePageNav({page_id: options.page_id})
      when "index"
        @deactivateClass [@pageToggled]
        @pageToggled = undefined

  navExpandCollapse: (options) =>
    id      = Number(options.id)
    subject = @collection.get(id)
    height  = subject.height()

    if @prevNav && @prevNav.id != id
      @navExpandAnim(@prevNav.nav, height, "up")

      @prevNav = {nav: options.nav, id: id}
      @navExpandAnim(@prevNav.nav, height, "down")

    else if @prevNav && @prevNav.id == id
      @navExpandAnim(@prevNav.nav, height, "up")
      @prevNav = undefined
    else
      @prevNav = {nav: options.nav, id: id}
      @navExpandAnim(@prevNav.nav, height, "down")

  updatePageNav: (options) =>
    page = "#page_#{options.page_id}"
    # subject = "#subject_#{options.subject_id}"

    if @pageToggled
      @deactivateClass [@pageToggled], =>
        @pageToggled = page
        @activateClass([@pageToggled])
    else
      @pageToggled = page
      @activateClass([@pageToggled])

  destroySubjectNav: (subjectId) =>
    $("#subject_#{subjectId}").closest("li").remove()
