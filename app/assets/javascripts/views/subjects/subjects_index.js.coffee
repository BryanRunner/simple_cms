class SimpleCms.Views.SubjectsIndex extends Backbone.View

  template: JST['subjects/index']

  events:
    'click .subject': 'activeateSubject'
    'click .page': 'activatePage'

  initialize: ->
    @collection.on('reset', @render, this)

  render: ->
    @$el.html(@template())
    @collection.forEach (subject) =>
      @renderSubject(subject)
    @

  renderSubject: (subject) =>
    subjectView = new SimpleCms.Views.Subject(model: subject)
    @$('.sidebar-nav').append(subjectView.render().el)

  activeateSubject: (event) ->
    event.preventDefault()

    target = $(event.target).attr('href')
    clicked = $(event.target)
    activePages = $('.pages.active')

    if @$(clicked).hasClass("active")
      @$(clicked).removeClass('active')
      @$(activePages).removeClass("active")
    else
      @$('.subject').removeClass('active')
      @$(activePages).removeClass("active")
      @$(clicked).addClass("active")
      @$(target).addClass("active")

    # use the length of pages.children +1 to dynamically set the height of .pages // each li is 41px tall
    # for now it is hard coded in, will probably be better to calc initial height in the render pages function or at least the number of items rendered
    # alert($('.pages').children.length)

  activatePage: (event) ->
    event.preventDefault()

    clicked = $(event.target)
    page = $('.page')
    pageActive = $('.page.active')

    if @$(clicked).hasClass("active")
      @$(pageActive).removeClass("active")
    else
      @$(pageActive).removeClass("active")
      @$(clicked).addClass("active")
