class SimpleCms.Views.SubjectsIndex extends Backbone.View

  template: JST['subjects/index']
  className: "col-md-3"

  initialize: ->
    @collection.on('reset', @render, this)

  render: ->
    @$el.html(@template())
    @collection.forEach (subject) =>
      @renderSubject(subject)
    @

  renderSubject: (subject) ->
    subjectView = new SimpleCms.Views.Subject(model: subject)
    @$('.subjects').append(subjectView.render().el)
