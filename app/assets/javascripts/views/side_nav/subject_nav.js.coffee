class SimpleCms.Views.SubjectNav extends SimpleCms.Views.HelperMethods

  template: JST['side_nav/subject_nav']
  tagName: "li"

  initialize: ->
    @model.on('change', @render, this)

  render: ->
    @$el.html(@template(subject: @model))
    @renderPages()
    @

  renderPages: ->
    pages = @model.attributes.pages
    pages.forEach (page) =>
      subjectPage = new SimpleCms.Views.PageNav(model: new SimpleCms.Models.Page(page))
      @$('.pages').append(subjectPage.render().el)
    @
