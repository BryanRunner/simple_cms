class SimpleCms.Views.Header extends SimpleCms.Views.HelperMethods

  template: JST['layout/header']

  events: ->
    'click #sidebar-toggle': 'toggleClick'

  initialize: ->
    @setElement('#header')
    @sidebar = $('#sidebar-wrapper')
    @toggled = false
    @render()

  render: ->
    @$el.html(@template())
    @

  toggleClick: (event) ->
    event.preventDefault()
    $(event.currentTarget).toggleClass('active')
    @animateNav()

  animateNav: () ->
    if @toggled == false
      @sidebar.velocity
        p: {translateX: ["0%", "-100%"]},
        o: {duration: 300, easing: "easeInOutQuint"}
      @toggled = true
    else
      @sidebar.velocity
        p: {translateX: ["-100%", "0%"]},
        o: {duration: 300, easing: "easeInOutQuint"}
      @toggled = false
