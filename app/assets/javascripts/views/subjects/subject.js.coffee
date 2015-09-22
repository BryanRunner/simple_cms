class SimpleCms.Views.Subject extends Backbone.View

  template: JST['subjects/subject']
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
      subjectPage = new SimpleCms.Views.Page(model: new SimpleCms.Models.Page(page))
      @$('.pages').append(subjectPage.render().el)
    @
