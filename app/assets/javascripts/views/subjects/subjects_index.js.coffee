class SimpleCms.Views.SubjectsIndex extends SimpleCms.Views.HelperMethods

  template: JST['subjects/index']

  events:
    'click .subject': 'handleSubject'
    'click .page': 'handlePage'

  initialize: ->
    # @collection.on('reset', @render, this)
    @render()

  render: ->
    @$el.html(@template())
    @collection.forEach (subject) =>
      @renderSubject(subject)
    @

  renderSubject: (subject) =>
    subjectView = new SimpleCms.Views.Subject(model: subject)
    @$('.sidebar-nav').append(subjectView.render().el)

  handleSubject: (event) ->
    clicked = @$(event.target)
    target = clicked.attr('href')
    activePages = @$('.pages.active')
    subject = @$('.subject')

    event.preventDefault()
    if clicked.hasClass("active")
      @deactivateClass([clicked, activePages])
    else
      @deactivateClass([subject, activePages])
      @activateClass([clicked, target])

  handlePage: (event) ->
    clicked = @$(event.target)
    page = @$('.page')
    activePage = @$('.page.active')

    if clicked.hasClass("active") == false
      @activateClass([clicked])
    @deactivateClass([activePage])
