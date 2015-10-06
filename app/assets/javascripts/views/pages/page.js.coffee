class SimpleCms.Views.Page extends SimpleCms.Views.HelperMethods

  template: JST['pages/page']
  className: 'container'

  initialize: ->
    @model = @collection.get(@id)
    @model.on('change', @render, this)

  render: ->
    @$el.html(@template(page: @model))
    @
