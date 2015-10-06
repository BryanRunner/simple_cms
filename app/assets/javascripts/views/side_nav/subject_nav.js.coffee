class SimpleCms.Views.SubjectNav extends SimpleCms.Views.HelperMethods

  template: JST['side_nav/subject_nav']
  tagName: "li"

  initialize: ->
    @model.on('change', @render, this)

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
