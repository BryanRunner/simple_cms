class SimpleCms.Views.SubjectsIndex extends SimpleCms.Views.HelperMethods

  template: JST['subjects/subjects_index']

  events: ->
    'click .delete-icon' : 'destroy'

  initialize: ->
    @render()

  render: ->
    @$el.html(@template(subjects: @collection))
    @

  destroy: (event) ->
    event.preventDefault()
    subjectId = $(event.currentTarget).attr("data-id")

    subject = @collection.get(subjectId)
    subject.destroy success: ->
      $(event.currentTarget).closest('li').remove()
      Backbone.trigger 'subjectDestroyed', subjectId
