class SimpleCms.Views.Page extends Backbone.View

  template: JST['pages/page']
  tagName: "li"

  initialize: ->
    @model.on('change', @render, this)

  render: ->
    @$el.html(@template(page: @model))
    @
