class SimpleCms.Views.Subject extends Backbone.View

  template: JST['subjects/subject']
  tagName: "li"

  initialize: ->
    @model.on('change', @render, this)

  render: ->
    # alert(@model.get("name"))
    @$el.html(@template(subject: @model))
    @renderPages()
    @

  renderPages: ->
    pages = @model.attributes.pages
    subject = @model.attributes
    pages.forEach (page) ->
      # alert(subject.name + '/' + page.name + '/')
      # for some reason I can't get the data from page to transfer over to the page view (page.js.coffee)
      subjectPage = new SimpleCms.Views.Page(model: page)
      @$('.subject').append(subjectPage.render().el)
    @
