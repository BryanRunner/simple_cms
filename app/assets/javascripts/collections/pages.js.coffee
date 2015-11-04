class SimpleCms.Collections.Pages extends Backbone.Collection

  model: SimpleCms.Models.Page
  url: ->
    '/pages'
