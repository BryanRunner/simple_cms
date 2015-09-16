class SimpleCms.Views.Subject extends Backbone.View

  template: JST['subjects/subject']
  tagName: "div"
  className: "list-group-item"

  initialize: ->
    @model.on('change', @render, this)

  render: ->
    # alert(@model.get("name"))
    @$el.html(@template(subject: @model))
    @
