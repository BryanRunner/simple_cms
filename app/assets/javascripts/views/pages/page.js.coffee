SimpleCms.Views.Page ||= {}

class SimpleCms.Views.Page extends Backbone.View

  template: JST['pages/page']
  tagName: "li"

  initialize: ->
    @model.on('change', @render, this)

  render: ->
    @$el.html(@template(page: @model))
    @renderSections()
    @

  renderSections: ->
    sections = @model.attributes.sections
    sections.forEach (section) =>
      pageSection = new SimpleCms.Views.Section(model: new SimpleCms.Models.Section(section))
      @$('.sections').append(pageSection.render().el)
    @  
