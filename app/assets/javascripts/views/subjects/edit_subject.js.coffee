class SimpleCms.Views.EditSubject extends SimpleCms.Views.HelperMethods

  template: JST['subjects/edit_subject']

  className: 'view'

  events: ->
    'submit #edit-subject' : 'updateSubject'

  initialize: ->
    @subject = @collection.get(@id)
    @render()

  render: ->
    @$el.html(@template(subject: @subject))
    @

  updateSubject: ->
    event.preventDefault()
    event.stopPropagation()
    name = $('#edit-subject-name').val()

    @subject.set {name: name}
    @subject.save success: (subject) ->
      SimpleCms.router.navigate('subjects', {trigger: true})
      $("#subject_#{@id}").html(name)
