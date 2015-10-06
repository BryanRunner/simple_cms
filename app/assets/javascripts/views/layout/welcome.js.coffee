class SimpleCms.Views.Welcome extends SimpleCms.Views.HelperMethods

  template: JST['layout/welcome']

  initialize: ->
    @setElement("#content")
    @render()

  render: ->
    @$el.html(@template())
    @
