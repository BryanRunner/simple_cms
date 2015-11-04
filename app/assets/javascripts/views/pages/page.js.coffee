class SimpleCms.Views.Page extends SimpleCms.Views.HelperMethods

  template: JST['pages/page']

  className: 'view'

  initialize: ->
    @render()

  render: ->
    @$el.html(@template(page: @model, sections: @model.get('sections')))
    @
