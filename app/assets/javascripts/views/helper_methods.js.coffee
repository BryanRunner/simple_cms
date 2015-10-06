class SimpleCms.Views.HelperMethods extends Backbone.View

  activateClass: (targets) ->
    targets.forEach (target) ->
      $(target).addClass("active")

  deactivateClass: (targets) ->
    targets.forEach (target) ->
      $(target).removeClass("active")
