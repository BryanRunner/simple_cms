class SimpleCms.Views.Page extends SimpleCms.Views.HelperMethods

  template: JST['pages/page']

  className: 'view'

  initialize: ->
    @model = @collection.get(@id)
    @sections = @model.attributes.sections
    @listenTo Backbone, 'subjectNavStatus', @navStatus
    Backbone.trigger 'navCheck'
    @render()

  render: ->
    @$el.html(@template(page: @model, sections: @sections))
    @

  navStatus: (status) ->
    if status == true
      Backbone.trigger 'pageChange', ["#{@model.get('id')}"]
    else
      Backbone.trigger 'subjectChange', ["#{@model.get('subject_id')}"]
      Backbone.trigger 'pageChange', ["#{@model.get('id')}"]
