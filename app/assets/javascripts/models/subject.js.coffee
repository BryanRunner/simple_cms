class SimpleCms.Models.Subject extends Backbone.Model

  initialize: ->
    @pages = new SimpleCms.Collections.Pages @get('pages')
