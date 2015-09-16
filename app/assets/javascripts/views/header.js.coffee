class SimpleCms.Views.Header extends Backbone.View

  template: JST['header']
  tagName: "nav"
  className: "navbar navbar-inverse"

  render: ->
    @$el.html(@template())
    @
