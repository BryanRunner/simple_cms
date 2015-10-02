class SimpleCms.Views.Header extends Backbone.View

  template: JST['header']
  tagName: "nav"
  className: "navbar navbar-default navbar-fixed-top"

  events:
    'click #sidebar-toggle': 'toggleClick'

  render: ->
    @$el.html(@template())
    @

  toggleClick: (event) ->
    navToggle = $('#sidebar-toggle')
    sidebar = $('#sidebar-wrapper')
    event.preventDefault()
    $(navToggle).toggleClass('active')
    if $(navToggle).hasClass('active')
      $(sidebar).velocity({
        p: {left: "0%"},
        o: {duration: 200}
      })
    else
      $(sidebar).velocity({
        p: {left: "-100%"},
        o: {duration: 200}
      })
