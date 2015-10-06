class SimpleCms.Views.PageContent extends Backbone.View

  template: JST['pages/page_content']
  className: 'container'

  initialize: ->
    @model = @collection.get(@id)
    @model.on('change', @render, this)
    console.log(@model)
    # @render()

  render: ->
    @$el.html(@template(page: @model))
    @
