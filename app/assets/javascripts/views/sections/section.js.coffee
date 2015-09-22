class SimpleCms.Views.Section extends Backbone.View

  template: JST['sections/section']
  tagName: 'li'

  initialize: ->
    @model.on('change', @render, this)

  render: ->
    @$el.html(@template(section: @model))
    @
