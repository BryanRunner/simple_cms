class SimpleCms.Views.Page extends SimpleCms.Views.HelperMethods

  template: JST['pages/page']

  initialize: ->
    @setElement("#content")
    @model = @collection.get(@id)
    @render()

  render: ->
    @$el.html(@template(page: @model))
    @
