class SimpleCms.Views.PageNav extends SimpleCms.Views.HelperMethods

  template: JST['side_nav/page_nav']
  tagName: "li"

  initialize: ->
    @model.on('change', @render, this)

  render: ->
    @$el.html(@template(page: @model))
    @
