class SimpleCms.Views.SubjectsIndex extends Backbone.View

  template: JST['subjects/index']
  tagName: "ul"
  className: "list-group"

  initialize: ->
    @collection.on('reset', @render, this)

  render: ->
    @$el.html(@template(subjects: @collection))
    @collection.forEach(@renderSubject)
    @

  renderSubject: (model) ->
    # alert(model.get("name"))
    view = new SimpleCms.Views.Subject(model: model)
    @$('.list-group').append(view.render().el)
