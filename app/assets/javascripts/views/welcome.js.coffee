class SimpleCms.Views.Welcome extends Backbone.View

  template: JST['welcome']
  className: "container"

  render: ->
    @$el.html(@template())
    @
