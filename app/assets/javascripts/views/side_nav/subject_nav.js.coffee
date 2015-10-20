class SimpleCms.Views.SubjectNav extends SimpleCms.Views.HelperMethods

  template: JST['side_nav/subject_nav']
  tagName: "li"

  events: ->
    'click .subject-nav' :'announceSubject'

  initialize: ->
    @listenTo(@model, 'change', @render)

  render: ->
    @$el.html(@template(subject: @model))
    @renderPagesNav()
    @

  renderPagesNav: ->
    pages = @model.attributes.pages
    pages.forEach (page) =>
      pageNav = new SimpleCms.Views.PageNav(model: new SimpleCms.Models.Page(page))
      @$('.pages-nav').append(pageNav.render().el)
    @

  announceSubject: ->
    event.preventDefault()

    # console.log($(event.currentTarget).children(":first").attr("href"))
    Backbone.trigger('subjectChange', ["#{@model.get('id')}"])
