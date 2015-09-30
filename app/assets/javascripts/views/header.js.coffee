class SimpleCms.Views.Header extends Backbone.View

  template: JST['header']
  tagName: "nav"
  className: "navbar navbar-default navbar-fixed-top"

  events:
    'mouseenter #sidebar-toggle': 'toggleMouseIn'
    'mouseleave #sidebar-toggle': 'toggleMouseOut'
    'click #sidebar-toggle': 'toggleClick'

  initialize: ->
    @wrapper = $('#wrapper')

  render: ->
    @$el.html(@template())
    @

  toggleMouseIn: ->
    wrapper = @wrapper

    if $(wrapper).hasClass('nav-expand') == false
      $(wrapper).addClass('nav-hover')

  toggleMouseOut: ->
    wrapper = @wrapper

    $(wrapper).removeClass('nav-hover')

  toggleClick: (e) ->
    wrapper = @wrapper

    e.preventDefault();
    $(wrapper).removeClass('nav-hover')
    $(wrapper).toggleClass('nav-expand')
    @$('#sidebar-toggle').toggleClass('active')
