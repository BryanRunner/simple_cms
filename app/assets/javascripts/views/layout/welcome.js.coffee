class SimpleCms.Views.Welcome extends SimpleCms.Views.HelperMethods

  template: JST['layout/welcome']

  className: 'view'

  initialize: ->
    @render()

  render: ->
    @$el.html(@template())
    @
