class SimpleCms.Models.Page extends Backbone.Model

  initialize: ->
    @sections = new SimpleCms.Collections.Sections @get('sections')
