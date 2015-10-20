class SimpleCms.Views.HelperMethods extends Backbone.View

  activateClass: (targets, callback) ->
    targets.forEach (target) ->
      $(target).addClass("active")
    callback? callback()

  deactivateClass: (targets, callback) ->
    targets.forEach (target) ->
      $(target).removeClass("active")
    callback? callback()

  subjectNavAnim: (target, attr, direction) ->
    switch direction
      when "down"
        target.velocity
          p: {height: ["#{attr}px", "0px"]},
          o: {duration: 300, easing: "easeInOutQuint", queue: false}
      when "up"
        target.velocity
          p: {height: ["0px", "#{attr}px"]},
          o: {duration: 300, easing: "easeInOutQuint", queue: false}
