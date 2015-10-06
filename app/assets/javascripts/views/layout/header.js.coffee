class SimpleCms.Views.Header extends SimpleCms.Views.HelperMethods

  template: JST['layout/header']

  events:
    'click #sidebar-toggle': 'toggleClick'

  initialize: ->
    @setElement("#header")
    @render()

  render: ->
    @$el.html(@template())
    @

  toggleClick: (event) ->
    navToggle = $('#sidebar-toggle')
    sidebar = $('#sidebar-wrapper')

    event.preventDefault()
    navToggle.toggleClass('active')
    if navToggle.hasClass('active')
      sidebar.velocity({
        p: {left: "0%"},
        o: {duration: 300}
      })
    else
      sidebar.velocity({
        p: {left: "-100%"},
        o: {duration: 300}
      })
