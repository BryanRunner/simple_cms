class SimpleCms.Views.NewSubject extends SimpleCms.Views.HelperMethods

  template: JST['subjects/new_subject']

  className: 'view'

  events: ->
    'submit #new-subject' : 'createSubject'

  initialize: ->
    @render()

  render: ->
    @$el.html(@template())
    @

  createSubject: (event) ->
    event.preventDefault()
    event.stopPropagation()
    name = $('#subject-name').val()

    @collection.create {name: name}, wait: true, success: (subject) ->
      SimpleCms.router.navigate('subjects', {trigger: true})
      # subjectNav = new SimpleCms.Views.SubjectNav(model: subject)
      Backbone.trigger 'subjectCreated', subject
      # $('.sidebar-nav').append(subjectNav.render().el)
