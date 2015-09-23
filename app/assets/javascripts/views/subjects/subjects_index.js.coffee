class SimpleCms.Views.SubjectsIndex extends Backbone.View

  template: JST['subjects/index']
  className: "col-md-3"

  events:
    'click .subject': 'animatePages'
    'click .page': 'animateSections'

  initialize: ->
    @collection.on('reset', @render, this)

  render: ->
    @$el.html(@template())
    @collection.forEach (subject) =>
      @renderSubject(subject)
    @$('.subject').velocity("transition.flipYIn", {stagger: 200})
    @

  renderSubject: (subject) ->
    subjectView = new SimpleCms.Views.Subject(model: subject)
    @$('.subjects').append(subjectView.render().el)

  animatePages: ->
    target = $(event.target).attr('href')
    @$("#{target} .page").velocity("transition.expandIn", {stagger: 100})

  animateSections: ->
    target = $(event.target).attr('href')
    @$("#{target} .section").velocity("transition.slideRightBigIn", {stagger: 100})
